package vscode;

/**
 * Represents a task execution that happens inside a shell.
 */
@:jsRequire("vscode", "ShellExecution")
extern class ShellExecution {
	/**
	 * Creates a shell execution with a full command line.
	 *
	 * or
	 *
	 * Creates a shell execution with a command and arguments. For the real execution the editor will
	 * construct a command line from the command and the arguments. This is subject to interpretation
	 * especially when it comes to quoting. If full control over the command line is needed please
	 * use the constructor that creates a `ShellExecution` with the full command line.
	 *
	 * @param commandLine The command line to execute.
	 * @param command The command to execute.
	 * @param args The command arguments.
	 * @param options Optional options for the started the shell.
	 */
	@:overload(function(command:EitherType<String, ShellQuotedString>, args:Array<EitherType<String, ShellQuotedString>>,
		?options:ShellExecutionOptions):Void {})
	function new(commandLine:String, ?options:ShellExecutionOptions);

	/**
	 * The shell command line. Is `undefined` if created with a command and arguments.
	 */
	var commandLine:Null<String>;

	/**
	 * The shell command. Is `undefined` if created with a full command line.
	 */
	var command:Null<EitherType<String, ShellQuotedString>>;

	/**
	 * The shell args. Is `undefined` if created with a full command line.
	 */
	var args:Null<Array<EitherType<String, ShellQuotedString>>>;

	/**
	 * The shell options used when the command line is executed in a shell.
	 * Defaults to undefined.
	 */
	var options:Null<ShellExecutionOptions>;
}
