package vscode;

/**
 * A diagnostics collection is a container that manages a set of
 * {@link Diagnostic diagnostics}. Diagnostics are always scopes to a
 * diagnostics collection and a resource.
 *
 * To get an instance of a `DiagnosticCollection` use
 * {@link languages.createDiagnosticCollection createDiagnosticCollection}.
 */
@:jsRequire("vscode", "DiagnosticCollection")
extern class DiagnosticCollection { // extends Iterable<{uri:Uri, diagnostics:ReadOnlyArray<Diagnostic>}> {

	/**
	 * The name of this diagnostic collection, for instance `typescript`. Every diagnostic
	 * from this collection will be associated with this name. Also, the task framework uses this
	 * name when defining [problem matchers](https://code.visualstudio.com/docs/editor/tasks#_defining-a-problem-matcher).
	 */
	var name(default, null):String;

	/**
	 * Assign diagnostics for given resource. Will replace
	 * existing diagnostics for that resource.
	 *
	 * @param uri A resource identifier.
	 * @param diagnostics Array of diagnostics or `undefined`
	 */
	overload function set(uri:Uri, diagnostics:Null<ReadOnlyArray<Diagnostic>>):Void;

	/**
	 * Replace diagnostics for multiple resources in this collection.
	 *
	 * _Note_ that multiple tuples of the same uri will be merged, e.g
	 * `[[file1, [d1]], [file1, [d2]]]` is equivalent to `[[file1, [d1, d2]]]`.
	 * If a diagnostics item is `undefined` as in `[file1, undefined]`
	 * all previous but not subsequent diagnostics are removed.
	 *
	 * @param entries An array of tuples, like `[[file1, [d1, d2]], [file2, [d3, d4, d5]]]`, or `undefined`.
	 */
	overload function set(entries:ReadOnlyArray<ReadOnlyArray<Any>>):Void;

	/**
	 * Remove all diagnostics from this collection that belong
	 * to the provided `uri`. The same as `#set(uri, undefined)`.
	 *
	 * @param uri A resource identifier.
	 */
	function delete(uri:Uri):Void;

	/**
	 * Remove all diagnostics from this collection. The same
	 * as calling `#set(undefined)`;
	 */
	function clear():Void;

	/**
	 * Iterate over each entry in this collection.
	 *
	 * @param callback Function to execute for each entry.
	 * @param thisArg The `this` context used when invoking the handler function.
	 */
	function forEach(callback:Uri->ReadOnlyArray<Diagnostic>->DiagnosticCollection->Void, ?thisArg:Any):Void;

	/**
	 * Get the diagnostics for a given resource. *Note* that you cannot
	 * modify the diagnostics-array returned from this call.
	 *
	 * @param uri A resource identifier.
	 * @returns An immutable array of {@link Diagnostic diagnostics} or `undefined`.
	 */
	function get(uri:Uri):Null<ReadOnlyArray<Diagnostic>>;

	/**
	 * Check if this collection contains diagnostics for a
	 * given resource.
	 *
	 * @param uri A resource identifier.
	 * @returns `true` if this collection has diagnostic for the given resource.
	 */
	function has(uri:Uri):Bool;

	/**
	 * Dispose and free associated resources. Calls
	 * {@link DiagnosticCollection.clear clear}.
	 */
	function dispose():Void;
}
