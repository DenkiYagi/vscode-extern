package vscode;

import vscode.TerminalShellExecution.AsyncIterable;

/**
 * A tool that can be invoked by a call to a {@link LanguageModelChat}.
 */
typedef LanguageModelTool<T> = {
	/**
	 * Invoke the tool with the given input and return a result.
	 *
	 * The provided {@link LanguageModelToolInvocationOptions.input} has been validated against the declared schema.
	 */
	function invoke(options:LanguageModelToolInvocationOptions<T>, token:CancellationToken):ProviderResult<LanguageModelToolResult>;

	/**
	 * Called once before a tool is invoked. It's recommended to implement this to customize the progress message that appears
	 * while the tool is running, and to provide a more useful message with context from the invocation input. Can also
	 * signal that a tool needs user confirmation before running, if appropriate.
	 *
	 * * *Note 1:* Must be free of side-effects.
	 * * *Note 2:* A call to `prepareInvocation` is not necessarily followed by a call to `invoke`.
	 */
	function prepareInvocation(options:LanguageModelToolInvocationPrepareOptions<T>, token:CancellationToken):ProviderResult<PreparedToolInvocation>;
}
