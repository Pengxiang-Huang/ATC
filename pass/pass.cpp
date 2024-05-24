#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"


#include "noelle/core/Noelle.hpp"

using namespace arcana::noelle;

namespace {
  struct HALIDE : public llvm::ModulePass {
    static char ID; 

    HALIDE() : ModulePass(ID) {}

    bool doInitialization (Module &M) override {
      errs() << "Hello LLVM World at \"doInitialization\"\n" ;
      return false;
    }
		
		/*
		 * check if the transformation can be applied on the program 
		 */
		bool check_halide_form(Module &M){
			bool isHalideForm = false;
			return isHalideForm;
		}


    bool runOnModule (Module &M) override {
			auto &noelle = getAnalysis<Noelle>();

			auto insts = noelle.numberOfProgramInstructions();

			errs() << "the program has " << insts << " instructions\n";

			auto loopStructures = noelle.getLoopStructures();

			for (auto LS : *loopStructures){
				auto entryInst = LS->getEntryInstruction();
				errs() << "Loop " << *entryInst << "\n";
				errs() << LS->getNestingLevel() << "\n";
			}

      return false;
    }

    void getAnalysisUsage(AnalysisUsage &AU) const override {
      errs() << "Hello LLVM World at \"getAnalysisUsage\"\n" ;
			AU.addRequired<Noelle>();	
    }
  };
}

// Next there is code to register your pass to "opt"
char HALIDE::ID = 0;
static RegisterPass<HALIDE> X("Halide", "Project for the ATC class");

// Next there is code to register your pass to "clang"
static HALIDE * _PassMaker = NULL;
static RegisterStandardPasses _RegPass1(PassManagerBuilder::EP_OptimizerLast,
    [](const PassManagerBuilder&, legacy::PassManagerBase& PM) {
        if(!_PassMaker){ PM.add(_PassMaker = new HALIDE());}}); // ** for -Ox
static RegisterStandardPasses _RegPass2(PassManagerBuilder::EP_EnabledOnOptLevel0,
    [](const PassManagerBuilder&, legacy::PassManagerBase& PM) {
        if(!_PassMaker){ PM.add(_PassMaker = new HALIDE()); }}); // ** for -O0
