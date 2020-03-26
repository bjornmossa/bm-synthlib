BmSynthLib {
  classvar <synthsPath;

 	*initClass {
	  StartUp.add{
      (this.filenameSymbol.asString.dirname+/+"synthDefs/*.scd").loadPaths;
	  }
	}
}