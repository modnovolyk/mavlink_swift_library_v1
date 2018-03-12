//
//  SetAttitudeTargetCommonMsg.swift
//  MAVLink Protocol Swift Library
//
//  Generated from ardupilotmega.xml, common.xml, uAvionix.xml on Tue Jan 17 2017 by mavgen_swift.py 
//  https://github.com/modnovolyk/MAVLinkSwift
//

import Foundation

/// Sets a desired vehicle attitude. Used by an external controller to command the vehicle (manual controller or other system).
public struct SetAttitudeTarget {

	/// Timestamp in milliseconds since system boot
	public let timeBootMs: UInt32

	/// System ID
	public let targetSystem: UInt8

	/// Component ID
	public let targetComponent: UInt8

	/// Mappings: If any of these bits are set, the corresponding input should be ignored: bit 1: body roll rate, bit 2: body pitch rate, bit 3: body yaw rate. bit 4-bit 6: reserved, bit 7: throttle, bit 8: attitude
	public let typeMask: UInt8

	/// Attitude quaternion (w, x, y, z order, zero-rotation is 1, 0, 0, 0)
	public let q: [Float]

	/// Body roll rate in radians per second
	public let bodyRollRate: Float

	/// Body pitch rate in radians per second
	public let bodyPitchRate: Float

	/// Body yaw rate in radians per second
	public let bodyYawRate: Float

	/// Collective thrust, normalized to 0 .. 1 (-1 .. 1 for vehicles capable of reverse trust)
	public let thrust: Float
}

extension SetAttitudeTarget: Message {
    public static let id = UInt8(82)
    public static var typeName = "SET_ATTITUDE_TARGET"
    public static var typeDescription = "Sets a desired vehicle attitude. Used by an external controller to command the vehicle (manual controller or other system)."
    public static var fieldDefinitions: [FieldDefinition] = [("timeBootMs", 0, "UInt32", 0, "Timestamp in milliseconds since system boot"), ("targetSystem", 36, "UInt8", 0, "System ID"), ("targetComponent", 37, "UInt8", 0, "Component ID"), ("typeMask", 38, "UInt8", 0, "Mappings: If any of these bits are set, the corresponding input should be ignored: bit 1: body roll rate, bit 2: body pitch rate, bit 3: body yaw rate. bit 4-bit 6: reserved, bit 7: throttle, bit 8: attitude"), ("q", 4, "[Float]", 4, "Attitude quaternion (w, x, y, z order, zero-rotation is 1, 0, 0, 0)"), ("bodyRollRate", 20, "Float", 0, "Body roll rate in radians per second"), ("bodyPitchRate", 24, "Float", 0, "Body roll rate in radians per second"), ("bodyYawRate", 28, "Float", 0, "Body roll rate in radians per second"), ("thrust", 32, "Float", 0, "Collective thrust, normalized to 0 .. 1 (-1 .. 1 for vehicles capable of reverse trust)")]

    public init(data: Data) throws {
		timeBootMs = try data.number(at: 0)
		q = try data.array(at: 4, capacity: 4)
		bodyRollRate = try data.number(at: 20)
		bodyPitchRate = try data.number(at: 24)
		bodyYawRate = try data.number(at: 28)
		thrust = try data.number(at: 32)
		targetSystem = try data.number(at: 36)
		targetComponent = try data.number(at: 37)
		typeMask = try data.number(at: 38)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 39)
		try payload.set(timeBootMs, at: 0)
		try payload.set(q, at: 4, capacity: 4)
		try payload.set(bodyRollRate, at: 20)
		try payload.set(bodyPitchRate, at: 24)
		try payload.set(bodyYawRate, at: 28)
		try payload.set(thrust, at: 32)
		try payload.set(targetSystem, at: 36)
		try payload.set(targetComponent, at: 37)
		try payload.set(typeMask, at: 38)
        return payload
    }
}
