package vscode;

import Vscode.Record;

/**
 * A telemetry logger which can be used by extensions to log usage and error telementry.
 *
 * A logger wraps around an {@link TelemetrySender sender} but it guarantees that
 * - user settings to disable or tweak telemetry are respected, and that
 * - potential sensitive data is removed
 *
 * It also enables an "echo UI" that prints whatever data is send and it allows the editor
 * to forward unhandled errors to the respective extensions.
 *
 * To get an instance of a `TelemetryLogger`, use
 * {@link env.createTelemetryLogger `createTelemetryLogger`}.
 */
@:jsRequire("vscode", "TelemetryLogger")
extern class TelemetryLogger {
	/**
	 * An {@link Event} which fires when the enablement state of usage or error telemetry changes.
	 */
	var onDidChangeEnableStates(default, null):Event<TelemetryLogger>;

	/**
	 * Whether or not usage telemetry is enabled for this logger.
	 */
	var isUsageEnabled(default, null):Bool;

	/**
	 * Whether or not error telemetry is enabled for this logger.
	 */
	var isErrorsEnabled(default, null):Bool;

	/**
	 * Log a usage event.
	 *
	 * After completing cleaning, telemetry setting checks, and data mix-in calls `TelemetrySender.sendEventData` to log the event.
	 * Automatically supports echoing to extension telemetry output channel.
	 * @param eventName The event name to log
	 * @param data The data to log
	 */
	function logUsage(eventName:String, ?data:Record<String, EitherType<Any, TelemetryTrustedValue<Any>>>):Void;

	/**
	 * Log an error event.
	 *
	 * After completing cleaning, telemetry setting checks, and data mix-in calls `TelemetrySender.sendEventData` to log the event. Differs from `logUsage` in that it will log the event if the telemetry setting is Error+.
	 * Automatically supports echoing to extension telemetry output channel.
	 * @param eventName The event name to log
	 * @param data The data to log
	 */
	overload function logError(eventName:String, ?data:Record<String, EitherType<Any, TelemetryTrustedValue<Any>>>):Void;

	/**
	 * Log an error event.
	 *
	 * Calls `TelemetrySender.sendErrorData`. Does cleaning, telemetry checks, and data mix-in.
	 * Automatically supports echoing to extension telemetry output channel.
	 * Will also automatically log any exceptions thrown within the extension host process.
	 * @param error The error object which contains the stack trace cleaned of PII
	 * @param data Additional data to log alongside the stack trace
	 */
	overload function logError(error:Error, ?data:Record<String, EitherType<Any, TelemetryTrustedValue<Any>>>):Void;

	/**
	 * Dispose this object and free resources.
	 */
	function dispose():Void;
}
