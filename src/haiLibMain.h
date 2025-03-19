
#ifndef _HAI_LIB_MAIN_H_
#define _HAI_LIB_MAIN_H_

/** Define HAIEXPORT for MSVC DLL building */
#ifdef WIN32
#ifdef _USRDLL
#define HAIEXPORT __declspec(dllexport)
#define HAIIMPORT __declspec(dllexport)
#else
#define HAIEXPORT
#define HAIIMPORT
#endif
#else
#define HAIEXPORT
#define HAIIMPORT
#endif

#ifdef __cplusplus
extern "C" {            /* Assume C declarations for C++ */
#endif  /* __cplusplus */

HAIEXPORT char* initializeMain(void);
HAIEXPORT int do_sys_info(void);
HAIEXPORT char* do_sys_stat(void);
HAIEXPORT char* clean_exit_term_connection(void);

#ifdef __cplusplus
}                       /* End of extern "C" { */
#endif  /* __cplusplus */

#endif  /* _HAI_LIB_MAIN_H_ */