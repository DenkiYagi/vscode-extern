package vscode;

/**
 * The document color provider defines the contract between extensions and feature of
 * picking and modifying colors in the editor.
 */
typedef DocumentColorProvider = {
	/**
	 * Provide colors for the given document.
	 *
	 * @param document The document in which the command was invoked.
	 * @param token A cancellation token.
	 * @returns An array of {@link ColorInformation color information} or a thenable that resolves to such. The lack of a result
	 * can be signaled by returning `undefined`, `null`, or an empty array.
	 */
	function provideDocumentColors(document:TextDocument, token:CancellationToken):ProviderResult<Array<ColorInformation>>;

	/**
	 * Provide {@link ColorPresentation representations} for a color.
	 *
	 * @param color The color to show and insert.
	 * @param context A context object with additional information
	 * @param token A cancellation token.
	 * @returns An array of color presentations or a thenable that resolves to such. The lack of a result
	 * can be signaled by returning `undefined`, `null`, or an empty array.
	 */
	function provideColorPresentations(color:Color, context:{
		/**
		 * The text document that contains the color
		 */
		document:TextDocument,
		/**
		 * The range in the document where the color is located.
		 */
		range:Range
	}, token:CancellationToken):ProviderResult<Array<ColorPresentation>>;
}
