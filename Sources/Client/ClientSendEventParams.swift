import Foundation

struct ClientSendEventParams {
  let projectId: String
  let iid: String
  let userId: String?
  let field: [String: AnyHashable]

  private let date: Date

  init(
    projectId: String,
    iid: String,
    userId: String?,
    field: [String: AnyHashable],
    date: Date = Date()
  ) {
    self.projectId = projectId
    self.iid = iid
    self.userId = userId
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
      "user_id": userId ?? "",
      "field_type": "OBJECT",
      "fields": [["object_value": field]],
    ]
    let body: [String: AnyHashable] = [
      "signals": [[
        "custom": custom,
      ]],
    ]
    return body
  }
}
