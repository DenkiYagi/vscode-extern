package vscode;

/**
 * A universal resource identifier representing either a file on disk
 * or another resource, like untitled resources.
 */
@:jsRequire("vscode", "Uri")
extern class Uri {
	/**
	 * Create an URI from a string, e.g. `http://www.example.com/some/path`,
	 * `file:///usr/home`, or `scheme:with/path`.
	 *
	 * *Note* that for a while uris without a `scheme` were accepted. That is not correct
	 * as all uris should have a scheme. To avoid breakage of existing code the optional
	 * `strict`-argument has been added. We *strongly* advise to use it, e.g. `Uri.parse('my:uri', true)`
	 *
	 * @see {@link Uri.toString}
	 * @param value The string value of an Uri.
	 * @param strict Throw an error when `value` is empty or when no `scheme` can be parsed.
	 * @returns A new Uri instance.
	 */
	static function parse(value:String, ?strict:Bool):Uri;

	/**
	 * Create an URI from a file system path. The {@link Uri.scheme scheme}
	 * will be `file`.
	 *
	 * The *difference* between {@link Uri.parse} and {@link Uri.file} is that the latter treats the argument
	 * as path, not as stringified-uri. E.g. `Uri.file(path)` is *not* the same as
	 * `Uri.parse('file://' + path)` because the path might contain characters that are
	 * interpreted (# and ?). See the following sample:
	 * ```ts
	 * const good = URI.file('/coding/c#/project1');
	 * good.scheme === 'file';
	 * good.path === '/coding/c#/project1';
	 * good.fragment === '';
	 *
	 * const bad = URI.parse('file://' + '/coding/c#/project1');
	 * bad.scheme === 'file';
	 * bad.path === '/coding/c'; // path is now broken
	 * bad.fragment === '/project1';
	 * ```
	 *
	 * @param path A file system or UNC path.
	 * @returns A new Uri instance.
	 */
	static function file(path:String):Uri;

	/**
	 * Create a new uri which path is the result of joining
	 * the path of the base uri with the provided path segments.
	 *
	 * - Note 1: `joinPath` only affects the path component
	 * and all other components (scheme, authority, query, and fragment) are
	 * left as they are.
	 * - Note 2: The base uri must have a path; an error is thrown otherwise.
	 *
	 * The path segments are normalized in the following ways:
	 * - sequences of path separators (`/` or `\`) are replaced with a single separator
	 * - for `file`-uris on windows, the backslash-character (`\`) is considered a path-separator
	 * - the `..`-segment denotes the parent segment, the `.` denotes the current segment
	 * - paths have a root which always remains, for instance on windows drive-letters are roots
	 * so that is true: `joinPath(Uri.file('file:///c:/root'), '../../other').fsPath === 'c:/other'`
	 *
	 * @param base An uri. Must have a path.
	 * @param pathSegments One more more path fragments
	 * @returns A new uri which path is joined with the given fragments
	 */
	static function joinPath(base:Uri, pathSegments:Rest<String>):Uri;

	/**
	 * Create an URI from its component parts
	 *
	 * @see {@link Uri.toString}
	 * @param components The component parts of an Uri.
	 * @returns A new Uri instance.
	 */
	static function from(components:{
		/**
		 * The scheme of the uri
		 */
		scheme:String,
		/**
		 * The authority of the uri
		 */
		?authority:String,
		/**
		 * The path of the uri
		 */
		?path:String,
		/**
		 * The query string of the uri
		 */
		?query:String,
		/**
		 * The fragment identifier of the uri
		 */
		?fragment:String
	}):Uri;

	/**
	 * Use the `file` and `parse` factory functions to create new `Uri` objects.
	 */
	private function new(scheme:String, authority:String, path:String, query:String, fragment:String);

	/**
	 * Scheme is the `http` part of `http://www.example.com/some/path?query#fragment`.
	 * The part before the first colon.
	 */
	var scheme(default, null):String;

	/**
	 * Authority is the `www.example.com` part of `http://www.example.com/some/path?query#fragment`.
	 * The part between the first double slashes and the next slash.
	 */
	var authority(default, null):String;

	/**
	 * Path is the `/some/path` part of `http://www.example.com/some/path?query#fragment`.
	 */
	var path(default, null):String;

	/**
	 * Query is the `query` part of `http://www.example.com/some/path?query#fragment`.
	 */
	var query(default, null):String;

	/**
	 * Fragment is the `fragment` part of `http://www.example.com/some/path?query#fragment`.
	 */
	var fragment(default, null):String;

	/**
	 * The string representing the corresponding file system path of this Uri.
	 *
	 * Will handle UNC paths and normalize windows drive letters to lower-case. Also
	 * uses the platform specific path separator.
	 *
	 * * Will *not* validate the path for invalid characters and semantics.
	 * * Will *not* look at the scheme of this Uri.
	 * * The resulting string shall *not* be used for display purposes but
	 * for disk operations, like `readFile` et al.
	 *
	 * The *difference* to the {@linkcode Uri.path path}-property is the use of the platform specific
	 * path separator and the handling of UNC paths. The sample below outlines the difference:
	 * ```ts
	 * const u = URI.parse('file://server/c$/folder/file.txt')
	 * u.authority === 'server'
	 * u.path === '/c$/folder/file.txt'
	 * u.fsPath === '\\server\c$\folder\file.txt'
	 * ```
	 */
	var fsPath(default, null):String;

	/**
	 * Derive a new Uri from this Uri.
	 *
	 * ```haxe
	 * var file = Uri.parse('before:some/file/path');
	 * var other = file.with({scheme: 'after'});
	 * Assert.ok(other.toString() == 'after:some/file/path');
	 * ```
	 *
	 * @param change An object that describes a change to this Uri. To unset components use `null` or
	 *  the empty string.
	 * @returns A new Uri that reflects the given change. Will return `this` Uri if the change
	 *  is not changing anything.
	 */
	function with(change:{
		/**
		 * The new scheme, defaults to this Uri's scheme.
		 */
		?scheme:String,
		/**
		 * The new authority, defaults to this Uri's authority.
		 */
		?authority:String,
		/**
		 * The new path, defaults to this Uri's path.
		 */
		?path:String,
		/**
		 * The new query, defaults to this Uri's query.
		 */
		?query:String,
		/**
		 * The new fragment, defaults to this Uri's fragment.
		 */
		?fragment:String
	}):Uri;

	/**
	 * Returns a string representation of this Uri. The representation and normalization
	 * of a URI depends on the scheme.
	 *
	 * * The resulting string can be safely used with {@link Uri.parse}.
	 * * The resulting string shall *not* be used for display purposes.
	 *
	 * *Note* that the implementation will encode _aggressive_ which often leads to unexpected,
	 * but not incorrect, results. For instance, colons are encoded to `%3A` which might be unexpected
	 * in file-uri. Also `&` and `=` will be encoded which might be unexpected for http-uris. For stability
	 * reasons this cannot be changed anymore. If you suffer from too aggressive encoding you should use
	 * the `skipEncoding`-argument: `uri.toString(true)`.
	 *
	 * @param skipEncoding Do not percentage-encode the result, defaults to `false`. Note that
	 *	the `#` and `?` characters occurring in the path will always be encoded.
	 * @returns A string representation of this Uri.
	 */
	function toString(?skipEncoding:Bool):String;

	/**
	 * Returns a JSON representation of this Uri.
	 *
	 * @returns An object.
	 */
	function toJSON():Any;
}
