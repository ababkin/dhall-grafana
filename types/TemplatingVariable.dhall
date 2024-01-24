let VariableType =
      < query | datasource | interval | custom | constant | adhoc | textbox >

let OptionSingle = { selected : Bool, text : Text, value : Text }

let OptionMulti = { selected : Bool, text : List Text, value : List Text }

let Option = < Single : OptionSingle | Multi : OptionMulti >

let Current = Option

let TemplatingVariableBase =
      { hide : Natural
      , label : Optional Text
      , description : Optional Text
      , name : Text
      , skipUrlSync : Bool
      , type : VariableType
      }

let QueryVariable =
          TemplatingVariableBase
      //\\  { query : Text
            , allValue : Optional Text
            , includeAll : Bool
            , multi : Bool
            , regex : Text
            , sort : Natural
            , refresh : Natural
            , options : List Option
            , datasource : Text
            , current : Optional Current
            , useTags : Bool
            }

let IntervalVariable =
          TemplatingVariableBase
      //\\  { query : Text
            , auto : Optional Bool
            , auto_count : Optional Natural
            , auto_min : Optional Text
            , options : List Option
            , current : Optional Current
            }

let DatasourceVariable =
          TemplatingVariableBase
      //\\  { query : Text
            , includeAll : Bool
            , multi : Bool
            , regex : Text
            , options : List Option
            , current : Optional Current
            }

let CustomVariable =
          TemplatingVariableBase
      //\\  { query : Text
            , allValue : Optional Text
            , includeAll : Bool
            , multi : Bool
            , options : List Option
            , current : Optional Current
            }

let ConstantVariable =
          TemplatingVariableBase
      //\\  { query : Text, options : List Option, current : Optional Current }

let TextboxVariable =
          TemplatingVariableBase
      //\\  { query : Text, options : List Option, current : Optional Current }

let AdHocVariable =
          TemplatingVariableBase
      //\\  { filters : List { key : Text, operator : Text, value : Text }
            , datasource : Text
            }

let Types =
      < QueryVariable : QueryVariable
      | IntervalVariable : IntervalVariable
      | DatasourceVariable : DatasourceVariable
      | CustomVariable : CustomVariable
      | ConstantVariable : ConstantVariable
      | TextboxVariable : TextboxVariable
      | AdHocVariable : AdHocVariable
      >

in  { Types
    , VariableType
    , Current
    , OptionSingle
    , OptionMulti
    , Option
    , QueryVariable
    , IntervalVariable
    , DatasourceVariable
    , CustomVariable
    , ConstantVariable
    , TextboxVariable
    , AdHocVariable
    }
