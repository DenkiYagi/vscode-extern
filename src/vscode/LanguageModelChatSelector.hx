package vscode;

/**
 * Describes how to select language models for chat requests.
 *
 * @see {@link lm.selectChatModels}
 */
typedef LanguageModelChatSelector = {
	/**
	 * A vendor of language models.
	 * @see {@link LanguageModelChat.vendor}
	 */
	var ?vendor:String;

	/**
	 * A family of language models.
	 * @see {@link LanguageModelChat.family}
	 */
	var ?family:String;

	/**
	 * The version of a language model.
	 * @see {@link LanguageModelChat.version}
	 */
	var ?version:String;

	/**
	 * The identifier of a language model.
	 * @see {@link LanguageModelChat.id}
	 */
	var ?id:String;
}
