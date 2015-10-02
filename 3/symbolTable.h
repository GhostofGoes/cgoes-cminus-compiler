#ifndef _SYMBOLTABLE_H_
#define _SYMBOLTABLE_H_
#include <map>
#include <vector>
#include <string>
#include <stdio.h>
#include <stdlib.h>

// // // // // // // // // // // // // // // // // // // // 
//
// Introduction
//
// This symbol table library supplies basic insert and lookup for
// symbols linked to void * pointers of data.  Plenty of room for
// improvement inlcuding: better debugging setup, passing of refs
// rather than values and purpose built char * routines, and C support.
//
// A main() is commented out that has testing code in it.
//
// Robert Heckendorn   Sep 30, 2015
//


// // // // // // // // // // // // // // // // // // // // 
//
// Class: Scope
//

// feel free to replace std::string  with std::string
class Scope {
private:
    static bool debugFlg;                      // turn on tedious debugging
    std::string name;                          // name of scope
    std::map<std::string , void *> symbols;    // use an ordered map (not as fast as unordered)

public:
    Scope(std::string newname);
    ~Scope();
    void debug(bool state);                    // sets the debug flag to new state
    void print(void (*printData)(void *));     // prints the table using the supplied function to print the void *
    void applyToAll(void (*action)(std::string , void *));  // applies func to all symbol/data pairs
    bool insert(std::string sym, void *ptr);   // inserts a new ptr associated with symbol sym 
                                               // returns false if already defined
    void *lookup(std::string sym);             // returns the ptr associated with sym
                                               // returns NULL if symbol not found
    std::string scopeName() {return name; };   // accessor for name
};



// // // // // // // // // // // // // // // // // // // // 
//
// Class: SymbolTable
//

class SymbolTable {
private:
    std::vector<Scope *> stack;
    bool debugFlg;

public:
    SymbolTable();
    void debug(bool state);                          // sets the debug flags
    int depth();                                     // what is the depth of the scope stack?
    void print(void (*printData)(void *));           // print all scopes using data printing function
    void applyToAllGlobal(void (*action)(std::string , void *));  // applies func to all symbol/data pairs
    void enter(std::string name);                    // enter a scope with given name
    void leave();                                    // leave a scope (not allowed to leave global)
    void *lookup(std::string sym);                   // returns ptr associated with sym
                                                     // returns NULL if symbol not found
    void *lookupGlobal(std::string sym);             // returns ptr associated with sym in globals
                                                     // returns NULL if symbol not found
    bool insert(std::string sym, void *ptr);         // inserts new ptr associated with symbol sym 
                                                     // returns false if already defined
    bool insertGlobal(std::string sym, void *ptr);   // inserts a new ptr associated with symbol sym 
                                                     // returns false if already defined
};

#endif
