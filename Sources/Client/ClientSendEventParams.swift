import Foundation

struct ClientSendEventParams {
  let projectId: String
  let iid: String
  let field: [String: AnyHashable]

  private let date: Date

  init(projectId: String, iid: String, field: [String: AnyHashable], date: Date = Date()) {
    self.projectId = projectId
    self.iid = iid
    self.field = field
    self.date = date
  }

  func toBody() -> [String: AnyHashable] {
    let custom: [String: AnyHashable] = [
      "pid": projectId,
      "iid": iid,
      "timestamp": date.timestamp,
      "namespace": "aware",
      "name": "event_log",
      "time_zone": "Asia/Seoul",
      "field_type": "OBJECT",
      "fields": [["object_value": field]],
    ]
    let params: [String: AnyHashable] = [
      "signals": [[
        "custom": custom,
      ]],
    ]
    return params
  }
}
