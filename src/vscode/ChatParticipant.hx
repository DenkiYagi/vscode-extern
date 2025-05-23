package vscode;

/**
 * A chat participant can be invoked by the user in a chat session, using the `@` prefix. When it is invoked, it handles the chat request and is solely
 * responsible for providing a response to the user. A ChatParticipant is created using {@link chat.createChatParticipant}.
 */
typedef ChatParticipant = {
	/**
	 * A unique ID for this participant.
	 */
	var id(default, null):String;

	/**
	 * An icon for the participant shown in UI.
	 */
	var ?iconPath:IconPath;

	/**
	 * The handler for requests to this participant.
	 */
	var requestHandler:ChatRequestHandler;

	/**
	 * This provider will be called once after each request to retrieve suggested followup questions.
	 */
	var ?followupProvider:ChatFollowupProvider;

	/**
	 * An event that fires whenever feedback for a result is received, e.g. when a user up- or down-votes
	 * a result.
	 *
	 * The passed {@link ChatResultFeedback.result result} is guaranteed to have the same properties as the result that was
	 * previously returned from this chat participant's handler.
	 */
	var onDidReceiveFeedback:Event<ChatResultFeedback>;

	/**
	 * Dispose this participant and free resources.
	 */
	function dispose():Void;
}
