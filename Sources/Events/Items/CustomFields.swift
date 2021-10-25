import Foundation

public struct CustomFields {
  let string1: String?
  let string2: String?
  let string3: String?
  let string4: String?
  let enum1: String?
  let enum2: String?
  let enum3: String?
  let enum4: String?
  let enum5: String?
  let enum6: String?
  let enum7: String?
  let enum8: String?
  let enum9: String?
  let enum10: String?
  let enum11: String?
  let enum12: String?
  let int1: Int?
  let int2: Int?
  let int3: Int?
  let int4: Int?
  let float1: Float?
  let float2: Float?
  let float3: Float?
  let float4: Float?

  init(
    string1: String? = nil,
    string2: String? = nil,
    string3: String? = nil,
    string4: String? = nil,
    enum1: String? = nil,
    enum2: String? = nil,
    enum3: String? = nil,
    enum4: String? = nil,
    enum5: String? = nil,
    enum6: String? = nil,
    enum7: String? = nil,
    enum8: String? = nil,
    enum9: String? = nil,
    enum10: String? = nil,
    enum11: String? = nil,
    enum12: String? = nil,
    int1: Int? = nil,
    int2: Int? = nil,
    int3: Int? = nil,
    int4: Int? = nil,
    float1: Float? = nil,
    float2: Float? = nil,
    float3: Float? = nil,
    float4: Float? = nil
  ) {
    self.string1 = string1
    self.string2 = string2
    self.string3 = string3
    self.string4 = string4
    self.enum1 = enum1
    self.enum2 = enum2
    self.enum3 = enum3
    self.enum4 = enum4
    self.enum5 = enum5
    self.enum6 = enum6
    self.enum7 = enum7
    self.enum8 = enum8
    self.enum9 = enum9
    self.enum10 = enum10
    self.enum11 = enum11
    self.enum12 = enum12
    self.int1 = int1
    self.int2 = int2
    self.int3 = int3
    self.int4 = int4
    self.float1 = float1
    self.float2 = float2
    self.float3 = float3
    self.float4 = float4
  }

  func toItemField() -> [String: AnyHashable] {
    var field: [String: AnyHashable] = [:]
    if let string1 = string1 {
      field["custom_str_1"] = string1
    }
    if let string2 = string2 {
      field["custom_str_2"] = string2
    }
    if let string3 = string3 {
      field["custom_str_3"] = string3
    }
    if let string4 = string4 {
      field["custom_str_4"] = string4
    }
    if let enum1 = enum1 {
      field["custom_enum_1"] = enum1
    }
    if let enum2 = enum2 {
      field["custom_enum_2"] = enum2
    }
    if let enum3 = enum3 {
      field["custom_enum_3"] = enum3
    }
    if let enum4 = enum4 {
      field["custom_enum_4"] = enum4
    }
    if let enum5 = enum5 {
      field["custom_enum_5"] = enum5
    }
    if let enum6 = enum6 {
      field["custom_enum_6"] = enum6
    }
    if let enum7 = enum7 {
      field["custom_enum_7"] = enum7
    }
    if let enum8 = enum8 {
      field["custom_enum_8"] = enum8
    }
    if let enum9 = enum9 {
      field["custom_enum_9"] = enum9
    }
    if let enum10 = enum10 {
      field["custom_enum_10"] = enum10
    }
    if let enum11 = enum11 {
      field["custom_enum_11"] = enum11
    }
    if let enum12 = enum12 {
      field["custom_enum_12"] = enum12
    }
    if let int1 = int1 {
      field["custom_int_1"] = int1
    }
    if let int2 = int2 {
      field["custom_int_2"] = int2
    }
    if let int3 = int3 {
      field["custom_int_3"] = int3
    }
    if let int4 = int4 {
      field["custom_int_4"] = int4
    }
    if let float1 = float1 {
      field["custom_float_1"] = float1
    }
    if let float2 = float2 {
      field["custom_float_2"] = float2
    }
    if let float3 = float3 {
      field["custom_float_3"] = float3
    }
    if let float4 = float4 {
      field["custom_float_4"] = float4
    }
    return field
  }
}
