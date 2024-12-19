let TimeseriesPanel = ../types/TimeseriesPanel.dhall

let MetricTargets = ../types/MetricTargets.dhall

in  { type = TimeseriesPanel.PanelType.timeseries
    , alert = None (../types/Alert.dhall).Type
    , id = 0
    , links = [] : List (../types/Link.dhall).Types
    , repeat = None Text
    , repeatDirection = None ../types/Direction.dhall
    , maxPerRow = None Natural
    , transparent = False
    , datasource = None Text
    , targets = [] : List MetricTargets
    , options = {=}
    , timeFrom = None Text
    , timeShift = None Text
    , hideTimeOverride = False
    , fieldConfig = None (../types/FieldConfig.dhall).Type
    } 