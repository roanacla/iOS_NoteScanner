//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateNoteInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, userId: String, title: String, text: String? = nil, editedTime: String, type: String) {
    graphQLMap = ["id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var userId: String {
    get {
      return graphQLMap["userId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var text: String? {
    get {
      return graphQLMap["text"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "text")
    }
  }

  public var editedTime: String {
    get {
      return graphQLMap["editedTime"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "editedTime")
    }
  }

  public var type: String {
    get {
      return graphQLMap["type"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

public struct ModelNoteConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(userId: ModelStringInput? = nil, title: ModelStringInput? = nil, text: ModelStringInput? = nil, editedTime: ModelStringInput? = nil, type: ModelStringInput? = nil, and: [ModelNoteConditionInput?]? = nil, or: [ModelNoteConditionInput?]? = nil, not: ModelNoteConditionInput? = nil) {
    graphQLMap = ["userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type, "and": and, "or": or, "not": not]
  }

  public var userId: ModelStringInput? {
    get {
      return graphQLMap["userId"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }

  public var title: ModelStringInput? {
    get {
      return graphQLMap["title"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var text: ModelStringInput? {
    get {
      return graphQLMap["text"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "text")
    }
  }

  public var editedTime: ModelStringInput? {
    get {
      return graphQLMap["editedTime"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "editedTime")
    }
  }

  public var type: ModelStringInput? {
    get {
      return graphQLMap["type"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var and: [ModelNoteConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelNoteConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelNoteConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelNoteConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelNoteConditionInput? {
    get {
      return graphQLMap["not"] as! ModelNoteConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelStringInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public enum ModelAttributeTypes: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case binary
  case binarySet
  case bool
  case list
  case map
  case number
  case numberSet
  case string
  case stringSet
  case null
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "binary": self = .binary
      case "binarySet": self = .binarySet
      case "bool": self = .bool
      case "list": self = .list
      case "map": self = .map
      case "number": self = .number
      case "numberSet": self = .numberSet
      case "string": self = .string
      case "stringSet": self = .stringSet
      case "_null": self = .null
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .binary: return "binary"
      case .binarySet: return "binarySet"
      case .bool: return "bool"
      case .list: return "list"
      case .map: return "map"
      case .number: return "number"
      case .numberSet: return "numberSet"
      case .string: return "string"
      case .stringSet: return "stringSet"
      case .null: return "_null"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelAttributeTypes, rhs: ModelAttributeTypes) -> Bool {
    switch (lhs, rhs) {
      case (.binary, .binary): return true
      case (.binarySet, .binarySet): return true
      case (.bool, .bool): return true
      case (.list, .list): return true
      case (.map, .map): return true
      case (.number, .number): return true
      case (.numberSet, .numberSet): return true
      case (.string, .string): return true
      case (.stringSet, .stringSet): return true
      case (.null, .null): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelSizeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public struct UpdateNoteInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, userId: String? = nil, title: String? = nil, text: String? = nil, editedTime: String? = nil, type: String? = nil) {
    graphQLMap = ["id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var userId: String? {
    get {
      return graphQLMap["userId"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }

  public var title: String? {
    get {
      return graphQLMap["title"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var text: String? {
    get {
      return graphQLMap["text"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "text")
    }
  }

  public var editedTime: String? {
    get {
      return graphQLMap["editedTime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "editedTime")
    }
  }

  public var type: String? {
    get {
      return graphQLMap["type"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

public struct DeleteNoteInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ModelNoteFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, userId: ModelStringInput? = nil, title: ModelStringInput? = nil, text: ModelStringInput? = nil, editedTime: ModelStringInput? = nil, type: ModelStringInput? = nil, and: [ModelNoteFilterInput?]? = nil, or: [ModelNoteFilterInput?]? = nil, not: ModelNoteFilterInput? = nil) {
    graphQLMap = ["id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var userId: ModelStringInput? {
    get {
      return graphQLMap["userId"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }

  public var title: ModelStringInput? {
    get {
      return graphQLMap["title"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var text: ModelStringInput? {
    get {
      return graphQLMap["text"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "text")
    }
  }

  public var editedTime: ModelStringInput? {
    get {
      return graphQLMap["editedTime"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "editedTime")
    }
  }

  public var type: ModelStringInput? {
    get {
      return graphQLMap["type"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var and: [ModelNoteFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelNoteFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelNoteFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelNoteFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelNoteFilterInput? {
    get {
      return graphQLMap["not"] as! ModelNoteFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public final class CreateNoteMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateNote($input: CreateNoteInput!, $condition: ModelNoteConditionInput) {\n  createNote(input: $input, condition: $condition) {\n    __typename\n    id\n    userId\n    title\n    text\n    editedTime\n    type\n  }\n}"

  public var input: CreateNoteInput
  public var condition: ModelNoteConditionInput?

  public init(input: CreateNoteInput, condition: ModelNoteConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createNote", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateNote.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createNote: CreateNote? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createNote": createNote.flatMap { $0.snapshot }])
    }

    public var createNote: CreateNote? {
      get {
        return (snapshot["createNote"] as? Snapshot).flatMap { CreateNote(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createNote")
      }
    }

    public struct CreateNote: GraphQLSelectionSet {
      public static let possibleTypes = ["Note"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userId", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("editedTime", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, title: String, text: String? = nil, editedTime: String, type: String) {
        self.init(snapshot: ["__typename": "Note", "id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var editedTime: String {
        get {
          return snapshot["editedTime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "editedTime")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}

public final class UpdateNoteMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateNote($input: UpdateNoteInput!, $condition: ModelNoteConditionInput) {\n  updateNote(input: $input, condition: $condition) {\n    __typename\n    id\n    userId\n    title\n    text\n    editedTime\n    type\n  }\n}"

  public var input: UpdateNoteInput
  public var condition: ModelNoteConditionInput?

  public init(input: UpdateNoteInput, condition: ModelNoteConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateNote", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateNote.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateNote: UpdateNote? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateNote": updateNote.flatMap { $0.snapshot }])
    }

    public var updateNote: UpdateNote? {
      get {
        return (snapshot["updateNote"] as? Snapshot).flatMap { UpdateNote(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateNote")
      }
    }

    public struct UpdateNote: GraphQLSelectionSet {
      public static let possibleTypes = ["Note"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userId", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("editedTime", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, title: String, text: String? = nil, editedTime: String, type: String) {
        self.init(snapshot: ["__typename": "Note", "id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var editedTime: String {
        get {
          return snapshot["editedTime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "editedTime")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}

public final class DeleteNoteMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteNote($input: DeleteNoteInput!, $condition: ModelNoteConditionInput) {\n  deleteNote(input: $input, condition: $condition) {\n    __typename\n    id\n    userId\n    title\n    text\n    editedTime\n    type\n  }\n}"

  public var input: DeleteNoteInput
  public var condition: ModelNoteConditionInput?

  public init(input: DeleteNoteInput, condition: ModelNoteConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteNote", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteNote.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteNote: DeleteNote? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteNote": deleteNote.flatMap { $0.snapshot }])
    }

    public var deleteNote: DeleteNote? {
      get {
        return (snapshot["deleteNote"] as? Snapshot).flatMap { DeleteNote(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteNote")
      }
    }

    public struct DeleteNote: GraphQLSelectionSet {
      public static let possibleTypes = ["Note"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userId", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("editedTime", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, title: String, text: String? = nil, editedTime: String, type: String) {
        self.init(snapshot: ["__typename": "Note", "id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var editedTime: String {
        get {
          return snapshot["editedTime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "editedTime")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}

public final class GetNoteQuery: GraphQLQuery {
  public static let operationString =
    "query GetNote($id: ID!) {\n  getNote(id: $id) {\n    __typename\n    id\n    userId\n    title\n    text\n    editedTime\n    type\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getNote", arguments: ["id": GraphQLVariable("id")], type: .object(GetNote.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getNote: GetNote? = nil) {
      self.init(snapshot: ["__typename": "Query", "getNote": getNote.flatMap { $0.snapshot }])
    }

    public var getNote: GetNote? {
      get {
        return (snapshot["getNote"] as? Snapshot).flatMap { GetNote(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getNote")
      }
    }

    public struct GetNote: GraphQLSelectionSet {
      public static let possibleTypes = ["Note"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userId", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("editedTime", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, title: String, text: String? = nil, editedTime: String, type: String) {
        self.init(snapshot: ["__typename": "Note", "id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var editedTime: String {
        get {
          return snapshot["editedTime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "editedTime")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}

public final class ListNotesQuery: GraphQLQuery {
  public static let operationString =
    "query ListNotes($filter: ModelNoteFilterInput, $limit: Int, $nextToken: String) {\n  listNotes(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      userId\n      title\n      text\n      editedTime\n      type\n    }\n    nextToken\n  }\n}"

  public var filter: ModelNoteFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelNoteFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listNotes", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListNote.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listNotes: ListNote? = nil) {
      self.init(snapshot: ["__typename": "Query", "listNotes": listNotes.flatMap { $0.snapshot }])
    }

    public var listNotes: ListNote? {
      get {
        return (snapshot["listNotes"] as? Snapshot).flatMap { ListNote(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listNotes")
      }
    }

    public struct ListNote: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelNoteConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelNoteConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Note"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("userId", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("editedTime", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, userId: String, title: String, text: String? = nil, editedTime: String, type: String) {
          self.init(snapshot: ["__typename": "Note", "id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var userId: String {
          get {
            return snapshot["userId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "userId")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        public var editedTime: String {
          get {
            return snapshot["editedTime"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "editedTime")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }
      }
    }
  }
}

public final class OnCreateNoteSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateNote {\n  onCreateNote {\n    __typename\n    id\n    userId\n    title\n    text\n    editedTime\n    type\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateNote", type: .object(OnCreateNote.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateNote: OnCreateNote? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateNote": onCreateNote.flatMap { $0.snapshot }])
    }

    public var onCreateNote: OnCreateNote? {
      get {
        return (snapshot["onCreateNote"] as? Snapshot).flatMap { OnCreateNote(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateNote")
      }
    }

    public struct OnCreateNote: GraphQLSelectionSet {
      public static let possibleTypes = ["Note"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userId", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("editedTime", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, title: String, text: String? = nil, editedTime: String, type: String) {
        self.init(snapshot: ["__typename": "Note", "id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var editedTime: String {
        get {
          return snapshot["editedTime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "editedTime")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}

public final class OnUpdateNoteSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateNote {\n  onUpdateNote {\n    __typename\n    id\n    userId\n    title\n    text\n    editedTime\n    type\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateNote", type: .object(OnUpdateNote.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateNote: OnUpdateNote? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateNote": onUpdateNote.flatMap { $0.snapshot }])
    }

    public var onUpdateNote: OnUpdateNote? {
      get {
        return (snapshot["onUpdateNote"] as? Snapshot).flatMap { OnUpdateNote(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateNote")
      }
    }

    public struct OnUpdateNote: GraphQLSelectionSet {
      public static let possibleTypes = ["Note"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userId", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("editedTime", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, title: String, text: String? = nil, editedTime: String, type: String) {
        self.init(snapshot: ["__typename": "Note", "id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var editedTime: String {
        get {
          return snapshot["editedTime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "editedTime")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}

public final class OnDeleteNoteSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteNote {\n  onDeleteNote {\n    __typename\n    id\n    userId\n    title\n    text\n    editedTime\n    type\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteNote", type: .object(OnDeleteNote.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteNote: OnDeleteNote? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteNote": onDeleteNote.flatMap { $0.snapshot }])
    }

    public var onDeleteNote: OnDeleteNote? {
      get {
        return (snapshot["onDeleteNote"] as? Snapshot).flatMap { OnDeleteNote(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteNote")
      }
    }

    public struct OnDeleteNote: GraphQLSelectionSet {
      public static let possibleTypes = ["Note"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userId", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("editedTime", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, title: String, text: String? = nil, editedTime: String, type: String) {
        self.init(snapshot: ["__typename": "Note", "id": id, "userId": userId, "title": title, "text": text, "editedTime": editedTime, "type": type])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var editedTime: String {
        get {
          return snapshot["editedTime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "editedTime")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}