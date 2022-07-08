function getOperatingSystem() {
  if (navigator.userAgent.indexOf('Win') != -1) return 'win';
  if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) return 'other';
  if (navigator.userAgent.indexOf('Mac') != -1) return 'mac';
  // If we detect Linux, but neither Ubuntu nor Debian (the latter usually
  // doesn't expose itself), we use a generic class to avoid falling
  // back to "other":
  if (navigator.userAgent.indexOf('Debian') != -1) return 'deb';
  if (navigator.userAgent.indexOf('Ubuntu') != -1) return 'deb';
  if (navigator.userAgent.indexOf('Android') != -1) return 'other';
  if (navigator.userAgent.indexOf('Linux') != -1) return 'linux-generic';
  return 'other';
}
document.body.className += ' is-os-' + getOperatingSystem();
