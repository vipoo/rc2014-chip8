
#ifndef __ERROR_REPORTS
#define __ERROR_REPORTS

extern void expectedEqualSign();
extern void unexpectedToken();
extern void unexpectedEntry();
extern void expectedColour();
extern void tmsDriverNotFound();
extern void warnNoTimerFound();

extern void expectedError(const char *p) __z88dk_fastcall;

#endif
