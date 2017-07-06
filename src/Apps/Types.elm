module Apps.Types exposing (App)

-- APP: info about a flora app

type alias App =
  { name: String
  , gallery: List String
  , description: String
  , storeURL: String
  , colour: String
  }
