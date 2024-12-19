let MetricTargets = ./MetricTargets.dhall

let PanelType = < timeseries >

let TimeseriesPanel =
      ./BasePanel.dhall
    //\\ { type : PanelType
        , datasource : Optional Text
        , targets : List MetricTargets
        , options : {}
        , timeFrom : Optional Text
        , timeShift : Optional Text
        , hideTimeOverride : Bool
        }

in  { Type = TimeseriesPanel, PanelType } 