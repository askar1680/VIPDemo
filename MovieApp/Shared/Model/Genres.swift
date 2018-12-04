import UIKit

class GenresList {
  
  public static let shared = GenresList()
  private var genresDict: Dictionary<Int, String>
  private init() {
    let genres = try! JSONDecoder().decode(Genres.self, from: Data(GenresList.jsonGenres.utf8))
    genresDict = Dictionary()
    for genre in genres.genres{
      genresDict[genre.id] = genre.name
    }
  }
  
  func getGenres(genreIds: Array<Int>) -> String {
    var genres = [String]()
    for id in genreIds{
      if let name = genresDict[id]{
        genres.append(name)
      }
    }
    return genres.joined(separator: ", ")
  }
  
  private struct Genres: Codable {
    var genres: Array<Genre>
  }
  
  private struct Genre: Codable {
    var id: Int
    var name: String
  }
  
  
  private static let jsonGenres = """
  {"genres": [
  {
  "id": 28,
  "name": "боевик"
  },
  {
  "id": 12,
  "name": "приключения"
  },
  {
  "id": 16,
  "name": "мультфильм"
  },
  {
  "id": 35,
  "name": "комедия"
  },
  {
  "id": 80,
  "name": "криминал"
  },
  {
  "id": 99,
  "name": "документальный"
  },
  {
  "id": 18,
  "name": "драма"
  },
  {
  "id": 10751,
  "name": "семейный"
  },
  {
  "id": 14,
  "name": "фэнтези"
  },
  {
  "id": 36,
  "name": "история"
  },
  {
  "id": 27,
  "name": "ужасы"
  },
  {
  "id": 10402,
  "name": "музыка"
  },
  {
  "id": 9648,
  "name": "детектив"
  },
  {
  "id": 10749,
  "name": "мелодрама"
  },
  {
  "id": 878,
  "name": "фантастика"
  },
  {
  "id": 10770,
  "name": "телевизионный фильм"
  },
  {
  "id": 53,
  "name": "триллер"
  },
  {
  "id": 10752,
  "name": "военный"
  },
  {
  "id": 37,
  "name": "вестерн"
  }
  ]
  }
  """
}
