BmSynthLib {
  classvar <samplesPath;

  *initClass {
	samplesPath = this.filenameSymbol.asString.dirname+/+"samples";

	StartUp.add{
      (this.filenameSymbol.asString.dirname+/+"synthDefs/*.scd").loadPaths;
	}
  }
}