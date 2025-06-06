package vscode;

import vscode.TerminalShellExecution.AsyncIterable;

/**
 * Represents extension specific information about the access to language models.
 */
typedef LanguageModelAccessInformation = {
	/**
	 * An event that fires when access information changes.
	 */
	var onDidChange:Event<Void>;

	/**
	 * Checks if a request can be made to a language model.
	 *
	 * *Note* that calling this function will not trigger a consent UI but just checks for a persisted state.
	 *
	 * @param chat A language model chat object.
	 * @return `true` if a request can be made, `false` if not, `undefined` if the language
	 * model does not exist or consent hasn't been asked for.
	 */
	function canSendRequest(chat:LanguageModelChat):Null<Bool>;
}
