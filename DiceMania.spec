Name:           DiceMania
Version:        1.0
Release:        80
Summary:        DiceMania
Group:          DiceMania
License:        None
Requires:       xulrunner

Source0:        %{name}.tar.gz

BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:      noarch

URL:            http://www.nsbetonline.com

%description
NSBetOnlineDevelopment program

%prep

# Extract archive and enter directory
%setup -q -n %{name}

# set lang
sed -i 's/"en"/"bs"/' defaults/preferences/prefs.js

%build
# Nothing to do

%install
rm -rf %{buildroot}

mkdir -p %{buildroot}/opt/%{name}
cp -pR * %{buildroot}/opt/%{name}/

desktop-file-install \
--delete-original \
--dir=%{buildroot}%{_datadir}/applications \
%{buildroot}/opt/%{name}/%{name}.desktop

%clean
rm -rf %{buildroot}

%post

# Copy xulrunner-stub, symlink xulrunner dir
cp -au /usr/lib/xulrunner-*/xulrunner-stub /opt/%{name}/%{name}
ln -sf /usr/lib/xulrunner-* /opt/%{name}/xulrunner

%files
%attr(0755,root,root) /opt/%{name}
%{_datadir}/applications/%{name}.desktop

%changelog
