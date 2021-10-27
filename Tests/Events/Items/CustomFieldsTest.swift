@testable import AwareSDK
import XCTest

class CustomFieldsTest: XCTestCase {
  let STRING1 = "str1"
  let STRING2 = "str2"
  let STRING3 = "str3"
  let STRING4 = "str4"
  let ENUM1 = "enum1"
  let ENUM2 = "enum2"
  let ENUM3 = "enum3"
  let ENUM4 = "enum4"
  let ENUM5 = "enum5"
  let ENUM6 = "enum6"
  let ENUM7 = "enum7"
  let ENUM8 = "enum8"
  let ENUM9 = "enum9"
  let ENUM10 = "enum10"
  let ENUM11 = "enum11"
  let ENUM12 = "enum12"
  let INT1 = 1
  let INT2 = 2
  let INT3 = 3
  let INT4 = 4
  let FLOAT1: Float = 1.0
  let FLOAT2: Float = 2.0
  let FLOAT3: Float = 3.0
  let FLOAT4: Float = 4.0

  var uut: CustomFields!

  func test_whenCallingToItemFieldWithSparseCustomFields_thenReturnSparseMap() {
    uut = CustomFields(
      string1: STRING1,
      enum1: ENUM1,
      int1: INT1,
      float1: FLOAT1
    )

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "custom_str_1": STRING1,
      "custom_enum_1": ENUM1,
      "custom_int_1": INT1,
      "custom_float_1": FLOAT1,
    ])
  }

  func test_whenCallingToItemFieldWithEmptyCustomFields_thenReturnEmtpyMap() {
    uut = CustomFields()

    let result = uut.toItemField()

    XCTAssertEqual(result, [:])
  }

  func test_whenCallingToItemFieldWithCustomFields_thenReturnMap() {
    uut = CustomFields(
      string1: STRING1,
      string2: STRING2,
      string3: STRING3,
      string4: STRING4,
      enum1: ENUM1,
      enum2: ENUM2,
      enum3: ENUM3,
      enum4: ENUM4,
      enum5: ENUM5,
      enum6: ENUM6,
      enum7: ENUM7,
      enum8: ENUM8,
      enum9: ENUM9,
      enum10: ENUM10,
      enum11: ENUM11,
      enum12: ENUM12,
      int1: INT1,
      int2: INT2,
      int3: INT3,
      int4: INT4,
      float1: FLOAT1,
      float2: FLOAT2,
      float3: FLOAT3,
      float4: FLOAT4
    )

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "custom_str_1": STRING1,
      "custom_str_2": STRING2,
      "custom_str_3": STRING3,
      "custom_str_4": STRING4,
      "custom_enum_1": ENUM1,
      "custom_enum_2": ENUM2,
      "custom_enum_3": ENUM3,
      "custom_enum_4": ENUM4,
      "custom_enum_5": ENUM5,
      "custom_enum_6": ENUM6,
      "custom_enum_7": ENUM7,
      "custom_enum_8": ENUM8,
      "custom_enum_9": ENUM9,
      "custom_enum_10": ENUM10,
      "custom_enum_11": ENUM11,
      "custom_enum_12": ENUM12,
      "custom_int_1": INT1,
      "custom_int_2": INT2,
      "custom_int_3": INT3,
      "custom_int_4": INT4,
      "custom_float_1": FLOAT1,
      "custom_float_2": FLOAT2,
      "custom_float_3": FLOAT3,
      "custom_float_4": FLOAT4,
    ])
  }
}
