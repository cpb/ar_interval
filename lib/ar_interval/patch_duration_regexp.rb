require 'active_support/duration'

class ActiveSupport::Duration::ISO8601Parser
  remove_const "SIGN_MARKER"
  SIGN_MARKER = /\A-|\+|/

  remove_const "DATE_COMPONENT"
  DATE_COMPONENT = /(-?\d+(?:[.,]\d+)?)(Y|M|D|W)/

  remove_const "TIME_COMPONENT"
  TIME_COMPONENT = /(-?\d+(?:[.,]\d+)?)(H|M|S)/
end
