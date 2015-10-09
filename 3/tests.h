#ifndef _TESTS_H_
#define _TESTS_H_

#include "CuTest.h"

/*
void TestTokerInteger( CuTest * tti );
void TestTokerString( CuTest * tts );
void TestTokerChar( CuTest * ttc );
*/

void TestAllocNode( CuTest * tc );

CuSuite * TestsGetSuite() {
	CuSuite* suite = CuSuiteNew();
	SUITE_ADD_TEST(suite, TestAllocNode);
	return suite;
}





#endif