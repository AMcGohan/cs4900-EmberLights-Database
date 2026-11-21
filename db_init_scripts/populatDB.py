import time
import requests
import mysql.connector

db = mysql.connector.connect(
    host="127.0.0.1",
    port=3320,
    user="user",
    password="password",
    database="Emberlights_DB"
)
cursor = db.cursor()

def get_or_create_genre(genre_name):
    genre_name = genre_name[:50]
    cursor.execute("SELECT genreID FROM Genres WHERE genreName = %s", (genre_name,))
    row = cursor.fetchone()
    if row:
        return row[0]
    cursor.execute("INSERT INTO Genres (genreName) VALUES (%s)", (genre_name,))
    return cursor.lastrowid

def get_or_create_album(album_name, artist_name):
    album_name = album_name[:100]
    artist_name = artist_name[:60]
    cursor.execute(
        "SELECT albumID FROM Albums WHERE albumName = %s AND artistName = %s",
        (album_name, artist_name)
    )
    row = cursor.fetchone()
    if row:
        return row[0]
    cursor.execute(
        "INSERT INTO Albums (albumName, artistName) VALUES (%s, %s)",
        (album_name, artist_name)
    )
    return cursor.lastrowid

def ms_to_time_str(ms):
    seconds = int(ms // 1000)
    hours = seconds // 3600
    minutes = (seconds % 3600) // 60
    secs = seconds % 60
    return f"{hours:02d}:{minutes:02d}:{secs:02d}"

# MusicBrainz Lucene queries mapped to clean genre names
search_queries = [
    ('tag:"synthwave"', "Synthwave"),
    ('tag:"bossa nova"', "Bossa Nova"),
    ('tag:"sea shanty"', "Sea Shanty"),
    ('tag:"bluegrass"', "Bluegrass"),
    ('tag:"math rock"', "Math Rock"),
    ('tag:"post-rock"', "Post-Rock"),
    ('tag:"city pop"', "City Pop"),
    ('tag:"afrobeat"', "Afrobeat"),
    ('tag:"cumbia"', "Cumbia"),
    ('tag:"chiptune"', "Chiptune"),
    ('tag:"jazz fusion"', "Jazz Fusion"),
    ('tag:"baroque"', "Classical"),
    ('tag:"celtic"', "Celtic Folk"),
    ('tag:"soundtrack"', "Soundtrack"),
    ('tag:"musical"', "Musical Theater"),
    ('artist:"The Longest Johns"', "Sea Shanty"),
    ('artist:"Darren Korb"', "Soundtrack"),
    ('artist:"C418"', "Electronic"),
    ('artist:"Joe Hisaishi"', "Soundtrack"),
    ('artist:"Boards of Canada"', "Electronic"),
    ('artist:"Carpenter Brut"', "Synthwave"),
    ('artist:"King Gizzard & The Lizard Wizard"', "Psychedelic Rock"),
    ('artist:"Polyphia"', "Progressive Rock"),
    ('artist:"Snarky Puppy"', "Jazz Fusion"),
    ('artist:"Vulfpeck"', "Funk"),
    ('artist:"Kamasi Washington"', "Jazz"),
    ('artist:"Stan Rogers"', "Folk"),
    ('artist:"Nickel Creek"', "Bluegrass"),
    ('artist:"Nujabes"', "Lo-Fi Hip Hop"),
    ('artist:"Sigur Ros"', "Post-Rock")
]

# MusicBrainz requires a meaningful User-Agent header
headers = {
    "User-Agent": "EmberlightsDB-Seeder/1.0 ( student-project@wright.edu )",
    "Accept": "application/json"
}

inserted_count = 0

try:
    for query, genre_label in search_queries:
        print(f"Fetching tracks for: {query}...")
        recordings = []

        for attempt in range(4):
            try:
                response = requests.get(
                    "https://musicbrainz.org/ws/2/recording",
                    params={"query": query, "fmt": "json", "limit": 50},
                    headers=headers,
                    timeout=15
                )
                if response.status_code == 503:
                    wait = 2 ** (attempt + 1)
                    print(f"  Rate-limited (503). Waiting {wait}s before retry...")
                    time.sleep(wait)
                    continue
                response.raise_for_status()
                recordings = response.json().get("recordings", [])
                break
            except requests.RequestException as e:
                print(f"  Skipping '{query}' due to error: {e}")
                break

        if not recordings:
            time.sleep(1.5)
            continue

        genre_id = get_or_create_genre(genre_label)

        for rec in recordings:
            duration_ms = rec.get("length")
            if not duration_ms or duration_ms < 1000:
                continue

            song_name = rec.get("title", "Unknown")[:100]
            artist_credits = rec.get("artist-credit", [])
            artist_name = artist_credits[0].get("name", "Unknown Artist") if artist_credits else "Unknown Artist"

            releases = rec.get("releases", [])
            album_name = releases[0].get("title", "Unknown Album") if releases else "Singles & Compilations"

            album_id = get_or_create_album(album_name, artist_name)

            cursor.execute(
                "SELECT songID FROM Songs WHERE songName = %s AND albumID = %s",
                (song_name, album_id)
            )
            if cursor.fetchone():
                continue

            duration_str = ms_to_time_str(duration_ms)

            cursor.execute(
                """
                INSERT INTO Songs (songName, genreID, songDuration, albumID)
                VALUES (%s, %s, %s, %s)
                """,
                (song_name, genre_id, duration_str, album_id)
            )
            inserted_count += 1

        db.commit()
        time.sleep(1.5) # Stay comfortably under MusicBrainz's 1 req/sec limit
finally:
    cursor.close()
    db.close()
    print(f"Closed DB connection. Inserted {inserted_count} new unique songs.")

