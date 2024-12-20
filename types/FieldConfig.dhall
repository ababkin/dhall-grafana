let Prelude =
      https://prelude.dhall-lang.org/v20.1.0/package.dhall
        sha256:26b0ef498663d269e4dc6a82b0ee289ec565d683ef4c00d0ebdd25333a5a3c98

let ColorMode = < fixed | thresholds | absolute | percentage >

let MatcherID = < byName >

let MatcherOption = Text -- < status | warn | error >

let MapValue = < Text : Text | MapEntry : List { mapKey : Text, mapValue : Text } >

let Defaults =
      { color : { fixedColor : Text, mode : ColorMode }
      , custom : {}
      , unit : Optional Text
      , mappings : List {}
      , thresholds :
          { mode : ColorMode
          , steps : List { color : Text, value : Optional Double }
          }
      }

let Override =
      { matcher : { id : MatcherID, options : MatcherOption }
      , properties : List (Prelude.Map.Type Text MapValue)
      }

let FieldConfig = { defaults : Optional Defaults, overrides : List Override }

let mkDefaults =
      \(color : { fixedColor : Text, mode : ColorMode }) ->
      \(baseThresholdColor : Text) ->
      \(thresholdColorMode : ColorMode) ->
      \(steps : List { color : Text, value : Double }) ->
        Some
          { color
          , custom = {=}
          , unit = None Text
          , mappings = [] : List {}
          , thresholds =
            { mode = thresholdColorMode
            , steps =
                  [ { color = baseThresholdColor, value = None Double } ]
                # Prelude.List.map
                    { color : Text, value : Double }
                    { color : Text, value : Optional Double }
                    ( \(t : { color : Text, value : Double }) ->
                        { color = t.color, value = Some t.value }
                    )
                    steps
            }
          }

in  { Type = FieldConfig
    , ColorMode
    , MatcherID
    , MatcherOption
    , MapValue
    , Defaults
    , Override
    , mkDefaults
    }
