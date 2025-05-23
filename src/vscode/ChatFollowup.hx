package vscode;

/**
 * A followup question suggested by the participant.
 */
typedef ChatFollowup = {
	/**
	 * The message to send to the chat.
	 */
	var prompt:String;

	/**
	 * A title to show the user. The prompt will be shown by default, when this is unspecified.
	 */
	var ?label:String;

	/**
	 * By default, the followup goes to the same participant/command. But this property can be set to invoke a different participant by ID.
	 * Followups can only invoke a participant that was contributed by the same extension.
	 */
	var ?participant:String;

	/**
	 * By default, the followup goes to the same participant/command. But this property can be set to invoke a different command.
	 */
	var ?command:String;
}
