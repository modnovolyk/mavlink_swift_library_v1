//
//  ScaledIMUCommonMsg.swift
//  MAVLink Micro Air Vehicle Communication Protocol
//
//  Generated from ardupilotmega.xml, common.xml, uAvionix.xml on Wed Jan 11 2017 by mavgen_swift.py 
//  http://qgroundcontrol.org/mavlink/start
//

import Foundation

/// The RAW IMU readings for the usual 9DOF sensor setup. This message should contain the scaled values to the described units
public struct ScaledIMU {

	/// Timestamp (milliseconds since system boot)
	public let timeBootMs: UInt32

	/// X acceleration (mg)
	public let xacc: Int16

	/// Y acceleration (mg)
	public let yacc: Int16

	/// Z acceleration (mg)
	public let zacc: Int16

	/// Angular speed around X axis (millirad /sec)
	public let xgyro: Int16

	/// Angular speed around Y axis (millirad /sec)
	public let ygyro: Int16

	/// Angular speed around Z axis (millirad /sec)
	public let zgyro: Int16

	/// X Magnetic field (milli tesla)
	public let xmag: Int16

	/// Y Magnetic field (milli tesla)
	public let ymag: Int16

	/// Z Magnetic field (milli tesla)
	public let zmag: Int16
}

extension ScaledIMU: Message {
    public static let id = UInt8(26)
    public static var typeName = "SCALED_IMU"
    public static var typeDescription = "The RAW IMU readings for the usual 9DOF sensor setup. This message should contain the scaled values to the described units"
    public static var fieldDefinitions: [FieldDefinition] = [("timeBootMs", 0, "UInt32", 0, "Timestamp (milliseconds since system boot)"), ("xacc", 4, "Int16", 0, "X acceleration (mg)"), ("yacc", 6, "Int16", 0, "Y acceleration (mg)"), ("zacc", 8, "Int16", 0, "Z acceleration (mg)"), ("xgyro", 10, "Int16", 0, "Angular speed around X axis (millirad /sec)"), ("ygyro", 12, "Int16", 0, "Angular speed around Y axis (millirad /sec)"), ("zgyro", 14, "Int16", 0, "Angular speed around Z axis (millirad /sec)"), ("xmag", 16, "Int16", 0, "X Magnetic field (milli tesla)"), ("ymag", 18, "Int16", 0, "Y Magnetic field (milli tesla)"), ("zmag", 20, "Int16", 0, "Z Magnetic field (milli tesla)")]

    public init(data: Data) throws {
		timeBootMs = try data.number(at: 0)
		xacc = try data.number(at: 4)
		yacc = try data.number(at: 6)
		zacc = try data.number(at: 8)
		xgyro = try data.number(at: 10)
		ygyro = try data.number(at: 12)
		zgyro = try data.number(at: 14)
		xmag = try data.number(at: 16)
		ymag = try data.number(at: 18)
		zmag = try data.number(at: 20)
    }

    public func pack() throws -> Data {
        var payload = Data(count: 22)
		try payload.set(timeBootMs, at: 0)
		try payload.set(xacc, at: 4)
		try payload.set(yacc, at: 6)
		try payload.set(zacc, at: 8)
		try payload.set(xgyro, at: 10)
		try payload.set(ygyro, at: 12)
		try payload.set(zgyro, at: 14)
		try payload.set(xmag, at: 16)
		try payload.set(ymag, at: 18)
		try payload.set(zmag, at: 20)
        return payload
    }
}
