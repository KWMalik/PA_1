#Computer Networks @Columbia University
#Spring 2012
#Programming Assignment 1

#Global vars
IDENTITY = $(shell whoami)
SUBMISSION = /home/lc2817/submission
ZIP = $(IDENTITY).zip
CC = javac		
EXE = java
#First step
STEP_1 = step_1
SRC_STEP1 =$(shell find ./$(IDENTITY)/$(STEP_1)/src -name "*java")
COMP_STEP1 =$(patsubst %.java,%.class,$(SRC_STEP1))
SRC_PATH_STEP1 =$(IDENTITY)/$(STEP_1)/src
EXE_STEP_1 = Main


gui: 
	@java -jar GUI.jar

%.class:%.java
	@$(CC) $^

step_1: $(COMP_STEP1)
	@$(EXE) -classpath $(SRC_PATH_STEP1) $(EXE_STEP_1) 

submit:
	@zip -r $(ZIP) $(IDENTITY)
	@$(SUBMISSION) $(ZIP)
	@make clean

.PHONY: clean
clean:
	@rm -f $(ZIP)
	@rm -f $(COMP_STEP1)
