BmSynthLib {
  classvar <samplesPath;

  *init {
	samplesPath = this.filenameSymbol.asString.dirname+/+"samples";
	(this.filenameSymbol.asString.dirname+/+"synthDefs/*.scd").loadPaths;
  }
}