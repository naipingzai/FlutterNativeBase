#include "bridge_api.h"
#include <string.h>
#include <stdio.h>

#if _WIN32
#include <windows.h>
#elif __APPLE__
#include <sys/utsname.h>
#include <TargetConditionals.h>
#else
#include <sys/utsname.h>
#endif

static const char* kVersion = "1.0.0";
static char sPlatformInfo[512] = {0};

/// Returns the version string of the native bridge library.
FFI_PLUGIN_EXPORT const char* native_bridge_version() {
  return kVersion;
}

/// Returns platform info as a null-terminated string.
/// Format: "os|arch|compiler|os_version"
FFI_PLUGIN_EXPORT const char* get_platform_info() {
  if (sPlatformInfo[0] != '\0') {
    return sPlatformInfo;
  }

  const char* os_name = "Unknown";
  const char* arch = "Unknown";
  const char* compiler = "Unknown";
  char os_version[128] = "Unknown";

#if _WIN32
  os_name = "Windows";
  #if defined(_M_X64) || defined(__x86_64__)
    arch = "x86_64";
  #elif defined(_M_IX86)
    arch = "x86";
  #elif defined(_M_ARM64)
    arch = "ARM64";
  #endif
  #ifdef _MSC_VER
    sprintf(os_version, "MSVC %d.%d", _MSC_VER / 100, _MSC_VER % 100);
    compiler = os_version;
  #elif defined(__GNUC__)
    sprintf(os_version, "GCC %d.%d.%d", __GNUC__, __GNUC_MINOR__, __GNUC_PATCHLEVEL__);
    compiler = os_version;
  #endif
  OSVERSIONINFOA vi;
  vi.dwOSVersionInfoSize = sizeof(vi);
  if (GetVersionExA(&vi)) {
    sprintf(os_version, "%d.%d.%d", vi.dwMajorVersion, vi.dwMinorVersion, vi.dwBuildNumber);
  }
#elif __APPLE__
  os_name = "macOS";
  #if TARGET_OS_IPHONE
    os_name = "iOS";
  #endif
  struct utsname ut;
  uname(&ut);
  arch = ut.machine;
  sprintf(os_version, "%s", ut.release);
  compiler = "Clang";
#else
  struct utsname ut;
  uname(&ut);
  if (strcmp(ut.sysname, "Linux") == 0) os_name = "Linux";
  arch = ut.machine;
  sprintf(os_version, "%s", ut.release);
  #ifdef __GNUC__
    sprintf(sPlatformInfo, "%s|%s|GCC %d.%d.%d|%s",
            os_name, arch, __GNUC__, __GNUC_MINOR__, __GNUC_PATCHLEVEL__, os_version);
    return sPlatformInfo;
  #elif defined(__clang__)
    compiler = "Clang";
  #endif
#endif

  sprintf(sPlatformInfo, "%s|%s|%s|%s", os_name, arch, compiler, os_version);
  return sPlatformInfo;
}
