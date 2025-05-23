package vscode;

/**
 * Options to configure the behaviour of a file save dialog.
 */
typedef SaveDialogOptions = {
	/**
	 * The resource the dialog shows when opened.
	 */
	var ?defaultUri:Uri;

	/**
	 * A human-readable string for the save button.
	 */
	var ?saveLabel:String;

	/**
	 * A set of file filters that are used by the dialog. Each entry is a human-readable label,
	 * like "TypeScript", and an array of extensions, for example:
	 * ```ts
	 * {
	 * 	'Images': ['png', 'jpg'],
	 * 	'TypeScript': ['ts', 'tsx']
	 * }
	 * ```
	 */
	var ?filters:DynamicAccess<Array<String>>;

	/**
	 * Dialog title.
	 *
	 * This parameter might be ignored, as not all operating systems display a title on save dialogs
	 * (for example, macOS).
	 */
	var ?title:String;
}
