package vscode;

/**
 * An extension context is a collection of utilities private to an
 * extension.
 *
 * An instance of an `ExtensionContext` is provided as the first
 * parameter to the `activate`-call of an extension.
 */
typedef ExtensionContext = {
	/**
	 * An array to which disposables can be added. When this
	 * extension is deactivated the disposables will be disposed.
	 *
	 * *Note* that asynchronous dispose-functions aren't awaited.
	 */
	var subscriptions(default, null):Array<{
		/**
		 * Function to clean up resources.
		 */
		function dispose():Void;
	}>;

	/**
	 * A memento object that stores state in the context
	 * of the currently opened {@link workspace.workspaceFolders workspace}.
	 */
	var workspaceState(default, null):Memento;

	/**
	 * A memento object that stores state independent
	 * of the current opened {@link workspace.workspaceFolders workspace}.
	 */
	var globalState(default, null):Memento;

	// & {
	// 	/**
	// 	 * Set the keys whose values should be synchronized across devices when synchronizing user-data
	// 	 * like configuration, extensions, and mementos.
	// 	 *
	// 	 * Note that this function defines the whole set of keys whose values are synchronized:
	// 	 *  - calling it with an empty array stops synchronization for this memento
	// 	 *  - calling it with a non-empty array replaces all keys whose values are synchronized
	// 	 *
	// 	 * For any given set of keys this function needs to be called only once but there is no harm in
	// 	 * repeatedly calling it.
	// 	 *
	// 	 * @param keys The set of keys whose values are synced.
	// 	 */
	// 	function setKeysForSync(keys:ReadOnlyArray<String>):Void;
	// };

	/**
	 * A secret storage object that stores state independent
	 * of the current opened {@link workspace.workspaceFolders workspace}.
	 */
	var secrets(default, null):SecretStorage;

	/**
	 * The uri of the directory containing the extension.
	 */
	var extensionUri(default, null):Uri;

	/**
	 * The absolute file path of the directory containing the extension. Shorthand
	 * notation for {@link TextDocument.uri ExtensionContext.extensionUri.fsPath} (independent of the uri scheme).
	 */
	var extensionPath(default, null):String;

	/**
	 * Gets the extension's global environment variable collection for this workspace, enabling changes to be
	 * applied to terminal environment variables.
	 */
	var environmentVariableCollection(default, null):GlobalEnvironmentVariableCollection;

	/**
	 * Get the absolute path of a resource contained in the extension.
	 *
	 * *Note* that an absolute uri can be constructed via {@linkcode Uri.joinPath} and
	 * {@linkcode ExtensionContext.extensionUri extensionUri}, e.g. `vscode.Uri.joinPath(context.extensionUri, relativePath);`
	 *
	 * @param relativePath A relative path to a resource contained in the extension.
	 * @returns The absolute path of the resource.
	 */
	function asAbsolutePath(relativePath:String):String;

	/**
	 * The uri of a workspace specific directory in which the extension
	 * can store private state. The directory might not exist and creation is
	 * up to the extension. However, the parent directory is guaranteed to be existent.
	 * The value is `undefined` when no workspace nor folder has been opened.
	 *
	 * Use {@linkcode ExtensionContext.workspaceState workspaceState} or
	 * {@linkcode ExtensionContext.globalState globalState} to store key value data.
	 *
	 * @see {@linkcode FileSystem workspace.fs} for how to read and write files and folders from
	 *  an uri.
	 */
	var storageUri(default, null):Null<Uri>;

	/**
	 * An absolute file path of a workspace specific directory in which the extension
	 * can store private state. The directory might not exist on disk and creation is
	 * up to the extension. However, the parent directory is guaranteed to be existent.
	 *
	 * Use {@linkcode ExtensionContext.workspaceState workspaceState} or
	 * {@linkcode ExtensionContext.globalState globalState} to store key value data.
	 *
	 * @deprecated Use {@link ExtensionContext.storageUri storageUri} instead.
	 */
	@:deprecated("Use `ExtensionContext.storageUri` instead.")
	var storagePath(default, null):Null<String>;

	/**
	 * The uri of a directory in which the extension can store global state.
	 * The directory might not exist on disk and creation is
	 * up to the extension. However, the parent directory is guaranteed to be existent.
	 *
	 * Use {@linkcode ExtensionContext.globalState globalState} to store key value data.
	 *
	 * @see {@linkcode FileSystem workspace.fs} for how to read and write files and folders from
	 *  an uri.
	 */
	var globalStorageUri(default, null):Uri;

	/**
	 * An absolute file path in which the extension can store global state.
	 * The directory might not exist on disk and creation is
	 * up to the extension. However, the parent directory is guaranteed to be existent.
	 *
	 * Use {@linkcode ExtensionContext.globalState globalState} to store key value data.
	 *
	 * @deprecated Use {@link ExtensionContext.globalStorageUri globalStorageUri} instead.
	 */
	@:deprecated("Use `ExtensionContext.globalStorageUri` instead.")
	var globalStoragePath(default, null):String;

	/**
	 * The uri of a directory in which the extension can create log files.
	 * The directory might not exist on disk and creation is up to the extension. However,
	 * the parent directory is guaranteed to be existent.
	 *
	 * @see {@linkcode FileSystem workspace.fs} for how to read and write files and folders from
	 *  an uri.
	 */
	var logUri(default, null):Uri;

	/**
	 * An absolute file path of a directory in which the extension can create log files.
	 * The directory might not exist on disk and creation is up to the extension. However,
	 * the parent directory is guaranteed to be existent.
	 *
	 * @deprecated Use {@link ExtensionContext.logUri logUri} instead.
	 */
	@:deprecated("Use `ExtensionContext.logUri` instead.")
	var logPath(default, null):String;

	/**
	 * The mode the extension is running in. See {@link ExtensionMode}
	 * for possible values and scenarios.
	 */
	var extensionMode(default, null):ExtensionMode;

	/**
	 * The current `Extension` instance.
	 */
	var extension(default, null):Extension<Dynamic>;

	/**
	 * An object that keeps information about how this extension can use language models.
	 *
	 * @see {@link LanguageModelChat.sendRequest}
	 */
	var languageModelAccessInformation(default, null):LanguageModelAccessInformation;
}
