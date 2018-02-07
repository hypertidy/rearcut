#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP _rearcut_P_d(SEXP, SEXP);
extern SEXP _rearcut_rearcut(SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"_rearcut_P_d",     (DL_FUNC) &_rearcut_P_d,     2},
    {"_rearcut_rearcut", (DL_FUNC) &_rearcut_rearcut, 2},
    {NULL, NULL, 0}
};

void R_init_rearcut(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
