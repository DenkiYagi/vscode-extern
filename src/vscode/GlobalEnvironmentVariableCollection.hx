package vscode;

/**
 * Value-object describing what options formatting should use.
 */
typedef GlobalEnvironmentVariableCollection = EnvironmentVariableCollection & {
	/**
	 * Gets scope-specific environment variable collection for the extension. This enables alterations to
	 * terminal environment variables solely within the designated scope, and is applied in addition to (and
	 * after) the global collection.
	 *
	 * Each object obtained through this method is isolated and does not impact objects for other scopes,
	 * including the global collection.
	 *
	 * @param scope The scope to which the environment variable collection applies to.
	 *
	 * If a scope parameter is omitted, collection applicable to all relevant scopes for that parameter is
	 * returned. For instance, if the 'workspaceFolder' parameter is not specified, the collection that applies
	 * across all workspace folders will be returned.
	 *
	 * @returns Environment variable collection for the passed in scope.
	 */
	function getScoped(scope:EnvironmentVariableScope):EnvironmentVariableCollection;
}
