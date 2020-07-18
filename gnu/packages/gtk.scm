;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2014, 2015, 2017, 2018, 2019 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2014 Eric Bavier <bavier@member.fsf.org>
;;; Copyright © 2015 Federico Beffa <beffa@fbengineering.ch>
;;; Copyright © 2015 Paul van der Walt <paul@denknerd.org>
;;; Copyright © 2015 Sou Bunnbu <iyzsong@gmail.com>
;;; Copyright © 2015 Andy Wingo <wingo@igalia.com>
;;; Copyright © 2015 David Hashe <david.hashe@dhashe.com>
;;; Coypright © 2015, 2016, 2017, 2018 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2016, 2017, 2020 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016 Fabian Harfert <fhmgufs@web.de>
;;; Copyright © 2016 Kei Kebreau <kkebreau@posteo.net>
;;; Copyright © 2016 Patrick Hetu <patrick.hetu@auf.org>
;;; Copyright © 2016 Nikita <nikita@n0.is>
;;; Copyright © 2017 Roel Janssen <roel@gnu.org>
;;; Copyright © 2017, 2018, 2019, 2020 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017, 2019, 2020 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2018 Alex Vong <alexvong1995@gmail.com>
;;; Copyright © 2018, 2020 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Pierre Neidhardt <mail@ambrevar.xyz>
;;; Copyright © 2019 Meiyo Peng <meiyo@riseup.net>
;;; Copyright © 2019 Giacomo Leidi <goodoldpaul@autistici.org>
;;; Copyright © 2020 Brendan Tildesley <mail@brendan.scot>
;;; Copyright © 2020 Guillaume Le Vaillant <glv@posteo.net>
;;; Copyright © 2020 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu packages gtk)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system waf)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages groovy)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages iso-codes)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages man)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages profiling)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 match))

(define-public atk
  (package
    (name "atk")
    (version "2.36.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "1217cmmykjgkkim0zr1lv5j13733m4w5vipmy4ivw0ll6rz28xpv"))))
    (build-system meson-build-system)
    (arguments
     `(#:glib-or-gtk? #t))  ; To wrap binaries and/or compile schemas.
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("glib" ,glib "bin")
       ("gobject-introspection" ,gobject-introspection)
       ("pkg-config" ,pkg-config)))
    (propagated-inputs
     `(("glib" ,glib)))
    (synopsis "GNOME accessibility toolkit")
    (description "ATK provides the set of accessibility interfaces that are
implemented by other toolkits and applications.  Using the ATK interfaces,
accessibility tools have full access to view and control running applications.")
    (home-page "https://wiki.gnome.org/Accessibility")
    (license license:lgpl2.1+)))

(define-public cairo
  (package
    (name "cairo")
    (version "1.16.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://cairographics.org/releases/cairo-"
                       version ".tar.xz"))
       (sha256
        (base32 "0c930mk5xr2bshbdljv005j3j8zr47gqmkry3q6qgvqky6rjjysy"))))
    (build-system glib-or-gtk-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:tests? #f ; See http://lists.gnu.org/archive/html/bug-guix/2013-06/msg00085.html
       #:configure-flags
       (list
        "--disable-static"
        ;; XXX: To be enabled.
        ;; "--enable-gallium=yes"
        ;; "--enable-gl=yes"
        ;; " --enable-glesv2=yes"
        ;; "--enable-glesv3=yes"
        ;; "--enable-cogl=yes"
        ;; "--enable-directfb=yes"
        ;; "--enable-vg=yes"
        "--enable-tee=yes"
        "--enable-xml=yes"
        (string-append "--with-html-dir="
                       (assoc-ref %outputs "doc")
                       "/share/gtk-doc/html"))))
    (native-inputs
     `(("gobject-introspection" ,gobject-introspection)
       ("pkg-config" ,pkg-config)
       ("python" ,python-wrapper)))
    (inputs
     `(("drm" ,libdrm)
       ("ghostscript" ,ghostscript)
       ("libspectre" ,libspectre)
       ("poppler" ,poppler)))
    (propagated-inputs
     `(;; ("cogl" ,cogl)
       ;; ("directfb" ,directfb)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("glib" ,glib)
       ;; ("gtk+" ,gtk+)
       ("libpng" ,libpng)
       ;; ("librsvg" ,librsvg)
       ;; ("opengl" ,mesa)
       ("pixman" ,pixman)
       ("x11" ,libx11)
       ("xcb" ,libxcb)
       ("xext" ,libxext)
       ("xrender" ,libxrender)))
    (synopsis "Multi-platform 2D graphics library")
    (description "Cairo is a 2D graphics library with support for multiple output
devices.  Currently supported output targets include the X Window System (via
both Xlib and XCB), Quartz, Win32, image buffers, PostScript, PDF, and SVG file
output.  Experimental backends include OpenGL, BeOS, OS/2, and DirectFB.")
    (home-page "https://cairographics.org/")
    (license
     ;; This project is dual-licensed.
     (list
      license:lgpl2.1+
      license:mpl1.1))))

(define-public cairo-xcb
  (package
    (inherit cairo)
    (name "cairo-xcb")
    (inputs
     `(("mesa" ,mesa)
       ,@(package-inputs cairo)))
    (arguments
     `(#:tests? #f
       #:configure-flags
       '("--enable-xlib-xcb" "--enable-gl" "--enable-egl")))
    (synopsis "2D graphics library (with X11 support)")))

(define-public harfbuzz
  (package
   (name "harfbuzz")
   (version "2.6.4")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://www.freedesktop.org/software/"
                                 "harfbuzz/release/harfbuzz-"
                                 version ".tar.xz"))
             (sha256
              (base32
               "04iwq13w6zkdhljmsxrzgg4fyh04qnwfn57rgrl9kmijc7cvh4wl"))))
   (build-system gnu-build-system)
   (outputs '("out"
              "bin")) ; 160K, only hb-view depend on cairo
   (inputs
    `(("cairo" ,cairo)))
   (propagated-inputs
    ;; There are all in the Requires or Requires.private field of '.pc'.
    `(("glib" ,glib)
      ("graphite2" ,graphite2)
      ("icu4c" ,icu4c)))
   (native-inputs
    `(("glib:bin" ,glib "bin")          ;for glib-mkenums
      ("gobject-introspection" ,gobject-introspection)
      ("pkg-config" ,pkg-config)
      ("python" ,python-wrapper)
      ("which" ,which)))
   (arguments
    `(#:configure-flags `("--with-graphite2"
                          "--with-gobject"
                          ,(string-append
                            "--bindir=" (assoc-ref %outputs "bin") "/bin"))))
   (synopsis "OpenType text shaping engine")
   (description
    "HarfBuzz is an OpenType text shaping engine.")
   (license (license:x11-style "file://COPYING"
                       "See 'COPYING' in the distribution."))
   (home-page "https://www.freedesktop.org/wiki/Software/HarfBuzz/")))

(define-public libdatrie
  (package
    (name "libdatrie")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://linux.thai.net/pub/ThaiLinux/software/"
                       "libthai/libdatrie-" version ".tar.xz"))
       (sha256
        (base32 "0jz9k0dd8jim4iyk5xrhkkdm4zq2ly6aw317ydjss44ymg97nz2l"))))
    (build-system gnu-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:configure-flags
       (list
        (string-append "--with-html-docdir="
                       (assoc-ref %outputs "doc")
                       "/share/doc/datrie/html"))))
    (native-inputs
     `(("doxygen" ,doxygen)
       ("pkg-config" ,pkg-config)))
    (synopsis "Double-Array Trie Library")
    (description "Libdatrie is an implementation of double-array structure for
representing trie.  Trie is a kind of digital search tree.")
    (home-page "https://linux.thai.net/~thep/datrie/datrie.html")
    (license license:lgpl2.1+)))

(define-public libthai
  (package
    (name "libthai")
    (version "0.1.28")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://linux.thai.net/pub/thailinux/software/"
                       "libthai/libthai-" version ".tar.xz"))
       (sha256
        (base32 "04g93bgxrcnay9fglpq2lj9nr7x1xh06i60m7haip8as9dxs3q7z"))))
    (build-system gnu-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:configure-flags
       (list
        (string-append "--with-html-docdir="
                       (assoc-ref %outputs "doc")
                       "/share/doc/libthai/html"))))
    (native-inputs
     `(("doxygen" ,doxygen)
       ("pkg-config" ,pkg-config)))
    (propagated-inputs
     `(("datrie" ,libdatrie)))
    (synopsis "Thai language support library")
    (description "LibThai is a set of Thai language support routines aimed to
ease developers’ tasks to incorporate Thai language support in their
applications.")
    (home-page "https://linux.thai.net/projects/libthai")
    (license license:lgpl2.1+)))

(define-public pango
  (package
    (name "pango")
    (version "1.44.7")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/pango/"
                       (version-major+minor version) "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "07qvxa2sk90chp1l12han6vxvy098mc37sdqcznyywyv2g6bd9b6"))))
    (build-system meson-build-system)
    (arguments
     `(#:glib-or-gtk? #t     ; To wrap binaries and/or compile schemas
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'disable-failing-tests
           (lambda _
             (substitute* "tests/meson.build"
               (("\\[ 'test-harfbuzz'.*") "")
               (("\\[ 'test-itemize'.*") "")
               (("\\[ 'test-layout'.*") ""))
             #t)))))
    (native-inputs
     `(("glib" ,glib "bin")
       ("gobject-introspection" ,gobject-introspection)
       ("help2man" ,help2man)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python" ,python-wrapper)))
    (inputs
     `(("zlib" ,zlib)))
    (propagated-inputs
     `(("cairo" ,cairo)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("fribidi" ,fribidi)
       ("glib" ,glib)
       ("harfbuzz" ,harfbuzz)
       ("libthai" ,libthai)
       ("libxft" ,libxft)
       ("libxrender" ,libxrender)))
    (synopsis "Text and font handling library")
    (description "Pango is a library for laying out and rendering of text, with
an emphasis on internationalization.  Pango can be used anywhere that text
layout is needed, though most of the work on Pango so far has been done in the
context of the GTK+ widget toolkit.  Pango forms the core of text and font
handling for GTK+-2.x.")
    (home-page "https://pango.gnome.org/")
    (license license:lgpl2.0+)))

(define-public pango-1.42
  (package
   (inherit pango)
   (version "1.42.4")
   (source (origin
             (method url-fetch)
             (uri (string-append "mirror://gnome/sources/pango/"
                                 (version-major+minor version) "/"
                                 "pango-" version ".tar.xz"))
             (sha256
              (base32
               "17bwb7dgbncrfsmchlib03k9n3xaalirb39g3yb43gg8cg6p8aqx"))))
   (build-system gnu-build-system)
   (arguments '())))

(define-public pangox-compat
  (package
    (name "pangox-compat")
    (version "0.0.2")
    (source (origin
             (method url-fetch)
             (uri (string-append "mirror://gnome/sources/" name "/"
                                 (version-major+minor version)  "/"
                                 name "-" version ".tar.xz"))
             (sha256
              (base32
               "0ip0ziys6mrqqmz4n71ays0kf5cs1xflj1gfpvs4fgy2nsrr482m"))))
    (build-system gnu-build-system)
    (inputs
     `(("glib" ,glib)
       ("pango" ,pango-1.42)))
    (native-inputs
     `(("intltool" ,intltool)
       ("pkg-config" ,pkg-config)))
    (home-page "https://developer.gnome.org/pango")
    (synopsis "Obsolete pango functions")
    (description  "Pangox was a X backend to pango.  It is now obsolete and no
longer provided by recent pango releases.  pangox-compat provides the
functions which were removed.")
    (license license:lgpl2.0+)))

(define-public ganv
  (package
    (name "ganv")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.drobilla.net/ganv-"
                                  version ".tar.bz2"))
              (sha256
               (base32
                "0pik2d3995z0rjcjhb4hsj5fsph3m8khg6j10k6mx4j2j727aq6l"))))
    (build-system waf-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'configure 'set-flags
           (lambda* (#:key outputs #:allow-other-keys)
             ;; Allow 'bin/ganv_bench' to find libganv-1.so.
             (setenv "LDFLAGS"
                     (string-append "-Wl,-rpath="
                                    (assoc-ref outputs "out") "/lib"))
             #t)))
       #:tests? #f)) ; no check target
    (inputs
     `(("gtk" ,gtk+-2)
       ("gtkmm" ,gtkmm-2)))
    (native-inputs
     `(("glib" ,glib "bin")             ; for glib-genmarshal, etc.
       ("pkg-config" ,pkg-config)))
    (home-page "https://drobilla.net/software/ganv/")
    (synopsis "GTK+ widget for interactive graph-like environments")
    (description
     "Ganv is an interactive GTK+ widget for interactive “boxes and lines” or
graph-like environments, e.g. modular synths or finite state machine
diagrams.")
    (license license:gpl3+)))

(define-public gtksourceview
  (package
    (name "gtksourceview")
    (version "4.6.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/gtksourceview/"
                       (version-major+minor version) "/"
                       "gtksourceview-" version ".tar.xz"))
       (sha256
        (base32 "11csdnb5xj1gkn1shynp3jdsfhhi7ks3apgmavfan0p6n85f64sc"))))
    (build-system meson-build-system)
    (outputs '("out" "doc" "glade"))
    (arguments
     `(#:glib-or-gtk? #t ;To wrap binaries and/or compile schemas
       #:configure-flags
       (list
        "-Dglade_catalog=true"
        "-Dgtk_doc=true")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-docbook-xml
           (lambda* (#:key inputs #:allow-other-keys)
             (with-directory-excursion "docs/reference"
               (substitute* '("gtksourceview-docs.xml.in" "intro.xml.in"
                              "lang-reference.xml.in" "lang-tutorial.xml"
                              "porting-guide-3-to-4.xml" "style-reference.xml.in")
                 (("http://www.oasis-open.org/docbook/xml/4.3/")
                  (string-append (assoc-ref inputs "docbook-xml")
                                 "/xml/dtd/docbook/"))))
             #t))
         (add-before 'check 'pre-check
           (lambda _
             ;; Tests require a running X server.
             (system "Xvfb :1 +extension GLX &")
             (setenv "DISPLAY" ":1")
             ;; Tests write to $HOME.
             (setenv "HOME" (getcwd))
             ;; Tests look for $XDG_RUNTIME_DIR.
             (setenv "XDG_RUNTIME_DIR" (getcwd))
             ;; For missing '/etc/machine-id'.
             (setenv "DBUS_FATAL_WARNINGS" "0")
             #t))
         (add-after 'install 'move-doc
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (doc (assoc-ref outputs "doc")))
               (mkdir-p (string-append doc "/share"))
               (rename-file
                (string-append out "/share/gtk-doc")
                (string-append doc "/share/gtk-doc")))
             #t))
         (add-after 'install 'move-glade
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (glade (assoc-ref outputs "glade")))
               (mkdir-p (string-append glade "/share"))
               (rename-file
                (string-append out "/share/glade")
                (string-append glade "/share/glade")))
             #t)))))
    (native-inputs
     `(("docbook-xml" ,docbook-xml-4.3)
       ("gettext" ,gettext-minimal)
       ("glib:bin" ,glib "bin")
       ("gobject-introspection" ,gobject-introspection)
       ("groovy" ,groovy)
       ("gtk-doc" ,gtk-doc)
       ("intltool" ,intltool)
       ("itstool" ,itstool)
       ("pkg-config" ,pkg-config)
       ("ruby" ,ruby)
       ("shared-mime-info" ,shared-mime-info)
       ("vala" ,vala)
       ("xorg-server" ,xorg-server-for-tests)))
    (inputs
     `(("glade" ,glade3)))
    (propagated-inputs
     `(("fribidi" ,fribidi)
       ("glib" ,glib)
       ("gtk+" ,gtk+)
       ("libxml2" ,libxml2)))
    (synopsis "GNOME source code widget")
    (description "GtkSourceView is a GNOME library that extends GtkTextView, the
standard GTK+ widget for multiline text editing.  GtkSourceView adds support for
syntax highlighting, undo/redo, file loading and saving, search and replace, a
completion system, printing, displaying line numbers, and other features typical
of a source code editor.")
    (home-page "https://wiki.gnome.org/Projects/GtkSourceView")
    (license license:lgpl2.1+)))

(define-public gtksourceview-2
  (package
    (inherit gtksourceview)
    (name "gtksourceview")
    (version "2.10.5") ; This is the last version which builds against gtk+2
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.bz2"))
       (sha256
        (base32 "07hrabhpl6n8ajz10s0d960jdwndxs87szxyn428mpxi8cvpg1f5"))
       (patches
        (search-patches
         "gtksourceview-2-add-default-directory.patch"))))
    (build-system glib-or-gtk-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:configure-flags
       (list
        (string-append "--with-html-dir="
                       (assoc-ref %outputs "doc")
                       "/share/gtk-doc/html"))
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'pre-check
           (lambda* (#:key inputs #:allow-other-keys)
             (let* ((xorg-server (assoc-ref inputs "xorg-server"))
                    (mime (assoc-ref inputs "shared-mime-info")))
               ;; There must be a running X server and make check doesn't start one.
               ;; Therefore we must do it.
               (system (format #f "~a/bin/Xvfb :1 &" xorg-server))
               (setenv "DISPLAY" ":1")
               ;; The .lang files must be found in $XDG_DATA_HOME/gtksourceview-2.0
               (system "ln -s gtksourceview gtksourceview-2.0")
               (setenv "XDG_DATA_HOME" (getcwd))
               ;; Finally, the mimetypes must be available.
               (setenv "XDG_DATA_DIRS" (string-append mime "/share/")))
             #t)))))
    (propagated-inputs
     `(("gtk+-2" ,gtk+-2)
       ,@(package-propagated-inputs gtksourceview)))))

(define-public gtksourceview-3
  (package
    (inherit gtksourceview)
    (name "gtksourceview")
    (version "3.24.11")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version) "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32"1zbpj283b5ycz767hqz5kdq02wzsga65pp4fykvhg8xj6x50f6v9"))))
    (build-system glib-or-gtk-build-system)
    (arguments
     `(#:configure-flags
       (list
        "--enable-glade-catalog"
        "--enable-gtk-doc"
        (string-append "--with-html-dir="
                       (assoc-ref %outputs "doc")
                       "/share/gtk-doc/html"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-docbook-xml
           (lambda* (#:key inputs #:allow-other-keys)
             (with-directory-excursion "docs/reference"
               (substitute* '("gtksourceview-docs.xml.in" "intro.xml.in"
                              "lang-reference.xml.in" "lang-tutorial.xml"
                              "style-reference.xml.in")
                 (("http://www.oasis-open.org/docbook/xml/4.3/")
                  (string-append (assoc-ref inputs "docbook-xml")
                                 "/xml/dtd/docbook/"))))
             #t))
         (add-before 'check 'pre-check
           (lambda _
             ;; Tests require a running X server.
             (system "Xvfb :1 +extension GLX &")
             (setenv "DISPLAY" ":1")
             ;; Tests write to $HOME.
             (setenv "HOME" (getcwd))
             ;; Tests look for $XDG_RUNTIME_DIR.
             (setenv "XDG_RUNTIME_DIR" (getcwd))
             ;; For missing '/etc/machine-id'.
             (setenv "DBUS_FATAL_WARNINGS" "0")
             #t))
         (add-after 'install 'move-glade
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (glade (assoc-ref outputs "glade")))
               (mkdir-p (string-append glade "/share"))
               (rename-file
                (string-append out "/share/glade")
                (string-append glade "/share/glade")))
             #t)))))))

(define-public gdk-pixbuf
  (package
    (name "gdk-pixbuf")
    (version "2.40.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "1rnlx9yfw970maxi2x6niaxmih5la11q1ilr7gzshz2kk585k0hm"))))
    (build-system meson-build-system)
    (arguments
     `(#:glib-or-gtk? #t     ; To wrap binaries and/or compile schemas
       #:configure-flags
       (list
        "-Djasper=true"
        "-Dinstalled_tests=false")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-docbook
           (lambda* (#:key inputs #:allow-other-keys)
             (with-directory-excursion "docs"
               (substitute* "meson.build"
                 (("http://docbook.sourceforge.net/release/xsl/current/")
                  (string-append (assoc-ref inputs "docbook-xsl")
                                 "/xml/xsl/docbook-xsl-1.79.1/")))
               (substitute* '("gdk-pixbuf-csource.xml"
                              "gdk-pixbuf-from-drawables.xml"
                              "gdk-pixbuf-query-loaders.xml"
                              "gdk-pixbuf-rendering.xml" "gdk-pixbuf.xml")
                 (("http://www.oasis-open.org/docbook/xml/4.3/")
                  (string-append (assoc-ref inputs "docbook-xml")
                                 "/xml/dtd/docbook/"))))
             #t)))))
    (native-inputs
     `(("docbook-xml" ,docbook-xml-4.3)
       ("docbook-xsl" ,docbook-xsl)
       ("gettext" ,gettext-minimal)
       ("glib:bin" ,glib "bin")
       ("gobject-introspection" ,gobject-introspection)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("xsltproc" ,libxslt)))
    (inputs
     `(("jasper" ,jasper)
       ("libjpeg" ,libjpeg-turbo)
       ("libpng" ,libpng)
       ("libtiff" ,libtiff)))
    (propagated-inputs
     `(("glib" ,glib)
       ("libx11"  ,libx11)
       ("shared-mime-info" ,shared-mime-info)))
    (synopsis "Image loading library")
    (description "GdkPixbuf is a library that loads image data in various
formats and stores it as linear buffers in memory.  The buffers can then be
scaled, composited, modified, saved, or rendered.")
    (home-page "https://wiki.gnome.org/Projects/GdkPixbuf")
    (license license:lgpl2.1+)))

;; To build gdk-pixbuf with SVG support, we need librsvg, and librsvg depends
;; on gdk-pixbuf, so this new varibale.  Also, librsvg adds 90MiB to the
;; closure size.
(define-public gdk-pixbuf+svg
  (package (inherit gdk-pixbuf)
    (name "gdk-pixbuf+svg")
    (inputs
     `(("librsvg" ,librsvg)
       ,@(package-inputs gdk-pixbuf)))
    (arguments
     (substitute-keyword-arguments (package-arguments gdk-pixbuf)
        ((#:phases phases)
          `(modify-phases ,phases
         (add-after 'install 'register-svg-loader
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out     (assoc-ref outputs "out"))
                    (librsvg (assoc-ref inputs "librsvg"))
                    (loaders
                     (append
                      (find-files out "^libpixbufloader-.*\\.so$")
                      (find-files librsvg "^libpixbufloader-.*\\.so$")))
                    (gdk-pixbuf-query-loaders
                     (string-append out "/bin/gdk-pixbuf-query-loaders")))
               (apply invoke
                      gdk-pixbuf-query-loaders
                      "--update-cache"
                      loaders))))))))
    (synopsis "Image loading library, with SVG support")))

(define-public at-spi2-core
  (package
    (name "at-spi2-core")
    (version "2.36.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "0nn0lnf07ayysq8c8irmvc91c2dszn04m5qs6jy60g3y1bg5gnl8"))))
    (build-system meson-build-system)
    (outputs '("out" "doc"))
    (arguments
     '(#:glib-or-gtk? #t    ; To wrap binaries and/or compile schemas.
       #:configure-flags
       (list
        "-Ddocs=true")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-documentation-path
           (lambda* (#:key outputs #:allow-other-keys)
             ;; Ensure that the cross-references point to the "doc" output.
             (substitute* "doc/libatspi/meson.build"
               (("docpath =.*")
                (string-append "docpath = '" (assoc-ref outputs "doc")
                               "/share/gtk-doc/html'\n")))
             #t))
         (add-before 'install 'prepare-doc-directory
           (lambda* (#:key outputs #:allow-other-keys)
             (mkdir-p (string-append (assoc-ref outputs "doc")
                                     "/share"))
             #t))
         (add-after 'unpack 'patch-docbook-sgml
           (lambda* (#:key inputs #:allow-other-keys)
             (let* ((xmldoc (string-append (assoc-ref inputs "docbook-xml")
                                           "/xml/dtd/docbook")))
               (substitute* "doc/libatspi/libatspi-docs.sgml"
                 (("http://.*/docbookx\\.dtd")
                  (string-append xmldoc "/docbookx.dtd")))
               #t)))
         (add-after 'install 'move-documentation
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (doc (assoc-ref outputs "doc")))
               (copy-recursively
                (string-append out "/share/gtk-doc")
                (string-append doc "/share/gtk-doc"))
               (delete-file-recursively
                (string-append out "/share/gtk-doc")))
             #t))
         (add-after 'install 'check
           (lambda _
             (setenv "HOME" (getenv "TMPDIR")) ; xfconfd requires a writable HOME
             ;; Run test-suite under a dbus session.
             (setenv "XDG_DATA_DIRS" ; for finding org.xfce.Xfconf.service
                     (string-append %output "/share"))
             ;; Don't fail on missing  '/etc/machine-id'.
             (setenv "DBUS_FATAL_WARNINGS" "0") ;
             (invoke "dbus-launch" "ninja" "test")))
         (delete 'check))))
    (native-inputs
     `(("docbook-xml" ,docbook-xml-4.3)
       ("gettext" ,gettext-minimal)
       ("gobject-introspection" ,gobject-introspection)
       ("gtk-doc" ,gtk-doc)
       ("glib" ,glib "bin")
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)))
    (propagated-inputs
     `(("dbus" ,dbus)
       ("glib" ,glib)
       ("libx11" ,libx11)
       ("libxi" ,libxi)
       ("libxtst" ,libxtst)))
    (synopsis "Assistive Technology Service Provider Interface, core components")
    (description "The Assistive Technology Service Provider Interface,
core components, is part of the GNOME accessibility project.")
    (home-page "https://wiki.gnome.org/Accessibility/")
    (license license:lgpl2.1+)))

;;; A minimal variant used to prevent a cycle with Inkscape.
(define at-spi2-core-minimal
  (package
    (inherit at-spi2-core)
    (name "at-spi2-core-minimal")
    (outputs (delete "doc" (package-outputs at-spi2-core)))
    (arguments
     (substitute-keyword-arguments (package-arguments at-spi2-core)
       ((#:configure-flags configure-flags)
        `(delete "-Ddocs=true" ,configure-flags))
       ((#:phases phases)
        `(modify-phases ,phases
           (delete 'set-documentation-path)
           (delete 'prepare-doc-directory)
           (delete 'move-documentation)))))
    (native-inputs
     (alist-delete "gtk-doc" (package-native-inputs at-spi2-core)))))

(define-public at-spi2-atk
  (package
    (name "at-spi2-atk")
    (version "2.34.2")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32
         "1w7l4xg00qx3dwhn0zaa64daiv5f073hdvjdxh0mrw7fw37264wh"))))
    (build-system meson-build-system)
    (arguments
     '(#:glib-or-gtk? #t    ; To wrap binaries and/or compile schemas.
       #:phases
       (modify-phases %standard-phases
         (replace 'check
           ;; Run test-suite under a dbus session.
           (lambda _
             (setenv "DBUS_FATAL_WARNINGS" "0")
             (invoke "dbus-launch" "meson" "test"))))))
    (native-inputs
     `(("dbus" ,dbus)                ; For tests
       ("gobject-introspection" ,gobject-introspection)
       ("libxml2" ,libxml2)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("atk" ,atk)
       ("glib" ,glib)))
    (propagated-inputs
     ;; TODO: Replace by at-spi2-core-minimal in the next staging window, or
     ;; when Inkscape 0.92 is upgraded to 1.0 to avoid a cycle.
     `(("at-spi2-core" ,at-spi2-core)))
    (synopsis "Assistive Technology Service Provider Interface, ATK bindings")
    (description "The Assistive Technology Service Provider Interface is part of
the GNOME accessibility project.")
    (home-page "https://wiki.gnome.org/Accessibility/")
    (license license:lgpl2.1+)))

(define-public gtk+-2
  (package
    (name "gtk+")
    (version "2.24.32")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "0bjq7ja9gwcv6n5q4qkvdjjx40wsdiikksz1zqxvxsm5vlyskj5n"))
       (patches
        (search-patches
         "gtk2-respect-GUIX_GTK2_PATH.patch"
         "gtk2-respect-GUIX_GTK2_IM_MODULE_FILE.patch"
         "gtk2-theme-paths.patch"))))
    (build-system gnu-build-system)
    (outputs '("out" "bin" "doc"))
    (arguments
     `(#:configure-flags
       (list
        "--with-xinput=yes"
        (string-append "--with-html-dir=" (assoc-ref %outputs "doc")
                       "/share/gtk-doc/html"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'disable-failing-tests
           (lambda _
             (substitute* "gtk/tests/recentmanager.c"
               (("g_test_add_func \\(\"/recent-manager/add-many\", recent_manager_add_many\\);")
                ""))
             (substitute* "gtk/tests/defaultvalue.c"
               (("return g_test_run\\(\\);")
                ""))
             #t))
         (add-before 'check 'pre-check
           (lambda _
             ;; Tests require a running X server.
             (system "Xvfb :1 +extension GLX &")
             (setenv "DISPLAY" ":1")
             ;; Tests write to $HOME.
             (setenv "HOME" (getcwd))
             ;; Tests look for $XDG_RUNTIME_DIR.
             (setenv "XDG_RUNTIME_DIR" (getcwd))
             ;; For missing '/etc/machine-id'.
             (setenv "DBUS_FATAL_WARNINGS" "0")
             #t))
         (add-after 'install 'remove-cache
           (lambda* (#:key outputs #:allow-other-keys)
             (for-each
              delete-file
              (find-files (assoc-ref outputs "out") "immodules.cache"))
             #t)))))
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("glib" ,glib "bin")
       ("gobject-introspection" ,gobject-introspection)
       ("intltool" ,intltool)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)
       ("xorg-server" ,xorg-server-for-tests)))
    (inputs
     `(("cups" ,cups)
       ("libx11" ,libx11)
       ("libxcomposite" ,libxcomposite)
       ("libxcursor" ,libxcursor)
       ("libxext" ,libxext)
       ("libxdamage" ,libxdamage)
       ("libxi" ,libxi)
       ("libxinerama" ,libxinerama)
       ("libxkbcommon" ,libxkbcommon)
       ("libxrandr" ,libxrandr)
       ("libxrender" ,libxrender)
       ("libxshmfence" ,libxshmfence)))
    (propagated-inputs
     `(("atk" ,atk)
       ("cairo" ,cairo)
       ("gdk-pixbuf" ,gdk-pixbuf+svg)
       ("glib" ,glib)
       ("pango" ,pango)))
    (native-search-paths
     (list
      (search-path-specification
       (variable "GUIX_GTK2_PATH")
       (files '("lib/gtk-2.0")))))
    (search-paths native-search-paths)
    (synopsis "Cross-platform toolkit for creating graphical user interfaces")
    (description "GTK+, or the GIMP Toolkit, is a multi-platform toolkit for creating
graphical user interfaces.  Offering a complete set of widgets, GTK+ is
suitable for projects ranging from small one-off tools to complete
application suites.")
    (home-page "https://www.gtk.org/")
    (license license:lgpl2.0+)))

(define-public gtk+
  (package
    (name "gtk+")
    (version "3.24.20")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "1wqxkd3xnqwihcawncp9mkf9bv5a5fg5i4ahm6klpl782vvnkb1d"))
       (patches
        (search-patches
         "gtk3-respect-GUIX_GTK3_PATH.patch"
         "gtk3-respect-GUIX_GTK3_IM_MODULE_FILE.patch"))))
    (build-system gnu-build-system)
    (outputs '("out" "bin" "doc"))
    (arguments
     `(#:configure-flags
       (list
        "--enable-x11-backend"
        "--enable-broadway-backend"
        "--enable-wayland-backend"
        "--enable-cloudproviders"
        (string-append "--with-html-dir=" (assoc-ref %outputs "doc")
                       "/share/gtk-doc/html"))
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'pre-check
           (lambda _
             ;; Tests require a running X server.
             (system "Xvfb :1 +extension GLX &")
             (setenv "DISPLAY" ":1")
             ;; Tests write to $HOME.
             (setenv "HOME" (getcwd))
             ;; Tests look for $XDG_RUNTIME_DIR.
             (setenv "XDG_RUNTIME_DIR" (getcwd))
             ;; For missing '/etc/machine-id'.
             (setenv "DBUS_FATAL_WARNINGS" "0")
             #t))
         (add-after 'unpack 'disable-failing-tests
           (lambda _
             (substitute* "testsuite/gtk/Makefile.in"
               (("builderparser cellarea check-icon-names check-cursor-names")
                "builderparser cellarea check-cursor-names")
               (("notify no-gtk-init object objects-finalize papersize rbtree")
                "no-gtk-init papersize rbtree")
               (("stylecontext templates textbuffer textiter treemodel treepath")
                "stylecontext textbuffer textiter treemodel treepath"))
             (substitute* "testsuite/a11y/Makefile.in"
               (("accessibility-dump tree-performance text children derive")
                "tree-performance text children derive"))
             (substitute* "testsuite/reftests/Makefile.in"
               (("TEST_PROGS = gtk-reftest")
                "TEST_PROGS = "))
             #t))
         ;; Move desktop files into 'bin' to avoid cycle references.
         (add-after 'install 'move-desktop-files
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (assoc-ref outputs "bin")))
               (mkdir-p (string-append bin "/share"))
               (rename-file
                (string-append out "/share/applications")
                (string-append bin "/share/applications"))
               #t))))))
    (native-inputs
     `(("docbook-xml" ,docbook-xml-4.1.2)
       ("gettext" ,gettext-minimal)
       ("glib" ,glib "bin")
       ("gobject-introspection" ,gobject-introspection)
       ("hicolor-icon-theme" ,hicolor-icon-theme)
       ("intltool" ,intltool)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)
       ("sassc" ,sassc)
       ("xorg-server" ,xorg-server-for-tests)
       ("xsltproc" ,libxslt)))
    (inputs
     `(("colord" ,colord)
       ("cups" ,cups)
       ("graphene" ,graphene)
       ("harfbuzz" ,harfbuzz)
       ("iso-codes" ,iso-codes)
       ("json-glib" ,json-glib)
       ("libxml2" ,libxml2)
       ("papi" ,papi)
       ("rest" ,rest)))
    (propagated-inputs
     `(("atk" ,atk)
       ("at-spi2-atk" ,at-spi2-atk)
       ("cairo" ,cairo)
       ("fribidi" ,fribidi)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("gdk-pixbuf" ,gdk-pixbuf+svg)
       ("glib" ,glib)
       ("libcloudproviders" ,libcloudproviders)
       ("libepoxy" ,libepoxy)
       ("libx11" ,libx11)
       ("libxcomposite" ,libxcomposite)
       ("libxcursor" ,libxcursor)
       ("libxdamage" ,libxdamage)
       ("libxext" ,libxext)
       ("libxfixes" ,libxfixes)
       ("libxi" ,libxi)
       ("libxinerama" ,libxinerama)
       ("libxkbcommon" ,libxkbcommon)
       ("libxrandr" ,libxrandr)
       ("libxrender" ,libxrender)
       ("mesa" ,mesa)
       ("pango" ,pango)
       ("wayland" ,wayland)
       ("wayland-protocols" ,wayland-protocols)))
    (native-search-paths
     (list
      (search-path-specification
       (variable "GUIX_GTK3_PATH")
       (files '("lib/gtk-3.0")))))
    (search-paths native-search-paths)
    (synopsis "Cross-platform toolkit for creating graphical user interfaces")
    (description "GTK+, or the GIMP Toolkit, is a multi-platform toolkit for creating
graphical user interfaces.  Offering a complete set of widgets, GTK+ is
suitable for projects ranging from small one-off tools to complete
application suites.")
    (home-page "https://www.gtk.org/")
    (license license:lgpl2.0+)))

;;;
;;; Guile bindings.
;;;

(define-public guile-cairo
  (package
    (name "guile-cairo")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://savannah/guile-cairo/guile-cairo-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0p6xrhf2k6n5dybn88050za7h90gnd7534n62l53vsca187pwgdf"))
              (modules '((guix build utils)))
              (snippet
               (begin
                 '(begin
                    ;; Install Scheme files in …/guile/site/X.Y.
                    (substitute* (find-files "." "^Makefile\\.in$")
                      (("^(.*)dir = (.*)/guile/site(.*)" _ name prefix suffix)
                       (string-append name "dir = " prefix
                                      "/guile/site/@GUILE_EFFECTIVE_VERSION@"
                                      suffix)))

                    ;; Guile 2.x <libguile.h> used to pull in <string.h> and
                    ;; other headers but this is no longer the case in 3.0.
                    (substitute* (find-files "." "\\.[ch]$")
                      (("^ *# *include.*libguile\\.h.*$")
                       "#include <libguile.h>\n#include <string.h>\n"))
                    #t)))))
    (build-system gnu-build-system)
    (arguments
     ;; Uses of 'scm_t_uint8' & co. are deprecated; don't stop the build
     ;; because of them.
     '(#:configure-flags '("--disable-Werror")))
    (inputs
     `(("guile-lib" ,guile-lib)
       ("expat" ,expat)
       ("guile" ,guile-3.0)))
    (propagated-inputs
     ;; The .pc file refers to 'cairo'.
     `(("cairo" ,cairo)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "https://www.nongnu.org/guile-cairo/")
    (synopsis "Cairo bindings for GNU Guile")
    (description
     "Guile-Cairo wraps the Cairo graphics library for Guile Scheme.
Guile-Cairo is complete, wrapping almost all of the Cairo API.  It is API
stable, providing a firm base on which to do graphics work.  Finally, and
importantly, it is pleasant to use.  You get a powerful and well-maintained
graphics library with all of the benefits of Scheme: memory management,
exceptions, macros, and a dynamic programming environment.")
    (license license:lgpl3+)))

(define-public guile2.2-cairo
  (package
    (inherit guile-cairo)
    (name "guile2.2-cairo")
    (inputs
     `(("guile" ,guile-2.2)
       ("guile-lib" ,guile2.2-lib)
       ,@(fold alist-delete (package-inputs guile-cairo)
               '("guile" "guile-lib"))))))

(define-public guile3.0-cairo
  (deprecated-package "guile3.0-cairo" guile-cairo))

(define-public guile-rsvg
  ;; Use a recent snapshot that supports Guile 2.2 and beyond.
  (let ((commit "05c6a2fd67e4fea1a7c3ff776729dc931bae6678")
        (revision "0"))
    (package
      (name "guile-rsvg")
      (version (string-append "2.18.1-" revision "."
                              (string-take commit 7)))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://gitlab.com/wingo/guile-rsvg/")
                      (commit commit)))
                (sha256
                 (base32
                  "0cnbl40df2sbhpc32cma6j6w312rfvcgbxxqaixgf0ymim3fb248"))
                (patches (search-patches "guile-rsvg-pkgconfig.patch"))
                (modules '((guix build utils)))
                (snippet
                 '(begin
                    (substitute* (find-files "." "Makefile\\.am")
                      (("/share/guile/site")
                       "/share/guile/site/@GUILE_EFFECTIVE_VERSION@"))
                    #t))
                (file-name (string-append name "-" version ".tar.gz"))))
      (build-system gnu-build-system)
      (arguments
       `(#:phases (modify-phases %standard-phases
                    (replace 'bootstrap
                      (lambda _
                        (invoke "autoreconf" "-vfi"))))))
      (native-inputs `(("pkg-config" ,pkg-config)
                       ("autoconf" ,autoconf)
                       ("automake" ,automake)
                       ("libtool" ,libtool)
                       ("texinfo" ,texinfo)))
      (inputs `(("guile" ,guile-3.0)
                ("librsvg" ,librsvg)
                ("guile-lib" ,guile-lib)))        ;for (unit-test)
      (propagated-inputs `(("guile-cairo" ,guile-cairo)))
      (synopsis "Render SVG images using Cairo from Guile")
      (description
       "Guile-RSVG wraps the RSVG library for Guile, allowing you to render SVG
images onto Cairo surfaces.")
      (home-page "https://wingolog.org/projects/guile-rsvg/")
      (license license:lgpl2.1+))))

(define-public guile2.2-rsvg
  (package
    (inherit guile-rsvg)
    (name "guile2.2-rsvg")
    (inputs
     `(("guile" ,guile-2.2)
       ("guile-lib" ,guile2.2-lib)
       ,@(fold alist-delete (package-inputs guile-rsvg)
               '("guile" "guile-lib"))))
    (propagated-inputs `(("guile-cairo" ,guile2.2-cairo)))))

(define-public guile3.0-rsvg
  (deprecated-package "guile3.0-rsvg" guile-rsvg))

(define-public guile-present
  (package
    (name "guile-present")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://wingolog.org/pub/guile-present/"
                                  "guile-present-" version ".tar.gz"))
              (sha256
               (base32
                "1qam447m05sxxv6x8dlzg7qnyfc4dh8apjw1idpfhpns671gfr6m"))
              (patches (search-patches "guile-present-coding.patch"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Allow builds with Guile 3.0.
                  (substitute* "configure"
                    (("2\\.2 2\\.0")
                     "3.0 2.2 2.0"))

                  ;; Install .go files in the right place.
                  (substitute* "Makefile.in"
                    (("/ccache") "/site-ccache"))
                  #t))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'post-install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out   (assoc-ref outputs "out"))
                    (bin   (string-append out "/bin"))
                    (guile (assoc-ref inputs "guile"))
                    (version
                     ,(match (assoc "guile" (package-inputs this-package))
                        (("guile" guile)
                         (version-major+minor (package-version guile))))))
               (substitute* (find-files bin ".*")
                 (("guile")
                  (string-append guile "/bin/guile -L "
                                 out "/share/guile/site/" version " -C "
                                 out "/lib/guile/" version "/site-ccache "))))
             #t)))))
    (native-inputs `(("pkg-config" ,pkg-config)))
    (inputs `(("guile" ,guile-3.0)))
    (propagated-inputs
     ;; These are used by the (present …) modules.
     `(("guile-lib" ,guile-lib)
       ("guile-cairo" ,guile-cairo)
       ("guile-rsvg" ,guile-rsvg)))
    (home-page "https://wingolog.org/software/guile-present/")
    (synopsis "Create SVG or PDF presentations in Guile")
    (description
     "Guile-Present defines a declarative vocabulary for presentations,
together with tools to render presentation documents as SVG or PDF.
Guile-Present can be used to make presentations programmatically, but also
includes a tools to generate PDF presentations out of Org mode and Texinfo
documents.")
    (license license:lgpl3+)))

(define-public guile2.2-present
  (package
    (inherit guile-present)
    (name "guile2.2-present")
    (inputs `(("guile" ,guile-2.2)))
    (propagated-inputs
     `(("guile-lib" ,guile2.2-lib)
       ("guile-cairo" ,guile2.2-cairo)
       ("guile-rsvg" ,guile2.2-rsvg)))))

(define-public guile3.0-present
  (deprecated-package "guile3.0-present" guile-present))

(define-public guile-gnome
   (package
    (name "guile-gnome")
    (version "2.16.5")
    (source (origin
              (method url-fetch)
              (uri
               (string-append "mirror://gnu/" name
                              "/guile-gnome-platform/guile-gnome-platform-"
                              version ".tar.gz"))
             (sha256
              (base32
               "1gnf3j96nip5kl99a268i0dy1hj7s1cfs66sps3zwysnkd7qr399"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("atk" ,atk)
       ;;("corba" ,corba) ; not packaged yet
       ("gconf" ,gconf)
       ("gobject-introspection" ,gobject-introspection)
       ;;("gthread" ,gthread) ; not packaged yet
       ("gnome-vfs" ,gnome-vfs)
       ("gdk-pixbuf" ,gdk-pixbuf)
       ("gtk+" ,gtk+-2)
       ("libglade" ,libglade)
       ("libgnome" ,libgnome)
       ("libgnomecanvas" ,libgnomecanvas)
       ("libgnomeui" ,libgnomeui)
       ("pango" ,pango)
       ("libffi" ,libffi)
       ("glib" ,glib)))
    (inputs `(("guile" ,guile-2.2)))
    (propagated-inputs
     `(("guile-cairo" ,guile2.2-cairo)
       ("g-wrap" ,g-wrap)
       ("guile-lib" ,guile2.2-lib)))
    (arguments
      `(#:tests? #f                               ;FIXME
        #:phases (modify-phases %standard-phases
                   (add-before 'configure 'pre-configure
                     (lambda* (#:key outputs #:allow-other-keys)
                       (let ((out (assoc-ref outputs "out")))
                         (substitute* (find-files "." "^Makefile.in$")
                           (("guilesite :=.*guile/site" all)
                            (string-append all "/@GUILE_EFFECTIVE_VERSION@")))
                         #t))))))
    (outputs '("out" "debug"))
    (synopsis "Guile interface for GTK+ programming for GNOME")
    (description
     "Includes guile-clutter, guile-gnome-gstreamer,
guile-gnome-platform (GNOME developer libraries), and guile-gtksourceview.")
    (home-page "https://www.gnu.org/software/guile-gnome/")
    (license license:gpl2+)
    (properties '((upstream-name . "guile-gnome-platform")
                  (ftp-directory . "/gnu/guile-gnome/guile-gnome-platform")))))

;;;
;;; C++ bindings.
;;;

(define-public cairomm
  (package
    (name "cairomm")
    (version "1.15.5")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://www.cairographics.org/releases/"
                       name "-" version ".tar.gz"))
       (sha256
        (base32 "1lg3q5ixs6igd2b4674mq5i4w0il0d92bxri94mwdjkq8gs2kdld"))))
    (build-system gnu-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:configure-flags
       (list
        "CXXFLAGS=-std=c++17")
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'move-doc
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (doc (assoc-ref outputs "doc")))
               (mkdir-p (string-append doc "/share"))
               (rename-file
                (string-append out "/share/doc")
                (string-append doc "/share/doc"))
               #t))))))
    (native-inputs
     `(("dot" ,graphviz)
       ("doxygen" ,doxygen)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("xsltproc" ,libxslt)))
    (propagated-inputs
     `(("cairo" ,cairo)
       ("sigc++" ,libsigc++)))
    (synopsis "C++ API for Cairo")
    (description "Cairomm is a C++ wrapper for the cairo graphics library.  It
offers all the power of cairo with an interface familiar to C++ developers,
including use of the Standard Template Library where it makes sense.")
    (home-page "https://cairographics.org/cairomm/")
    (license license:lgpl2.0+)))

(define-public cairomm-1.13
  (package
    (inherit cairomm)
    (name "cairomm")
    (version "1.13.1")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://www.cairographics.org/releases/"
                       name "-" version ".tar.gz"))
       (sha256
        (base32 "1xlfl0fm5mgv53lr8xjv2kqsk3bz67qkk6qzvbrqmbvbvvbqp9wp"))))
    (propagated-inputs
     `(("cairo" ,cairo)
       ("sigc++" ,libsigc++-2)))))

(define-public pangomm
  (package
    (name "pangomm")
    (version "2.43.2")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "1yin5b7hfvz0qdfxgnlk6kclyfhcv0fz10kjsgai59zv0v6g6kbr"))))
    (build-system glib-or-gtk-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'move-doc
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (doc (assoc-ref outputs "doc")))
               (mkdir-p (string-append doc "/share"))
               (rename-file
                (string-append out "/share/doc")
                (string-append doc "/share/doc"))
               #t))))))
    (native-inputs
     `(("dot" ,graphviz)
       ("doxygen" ,doxygen)
       ("m4" ,m4)
       ("mm-common" ,mm-common)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python" ,python-wrapper)
       ("xsltproc" ,libxslt)))
    (propagated-inputs
     `(("cairomm" ,cairomm)
       ("glibmm" ,glibmm)
       ("pango" ,pango)))
    (synopsis "C++ API for Pango")
    (description "Pangomm is the C++ interface for the Pango font layout
library.")
    (home-page "https://pango.gnome.org//")
    (license
     (list
      ;; Library
      license:lgpl2.1+
      ;; Tools
      license:gpl2+))))

(define-public pangomm-2.42
  (package
    (inherit pangomm)
    (name "pangomm")
    (version "2.42.1")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "03zli5amizhv9bfklwfq7xyf0b5dagchx1lnz9f0v1rhk69h9gql"))))
    (propagated-inputs
     `(("cairomm" ,cairomm-1.13)
       ("glibmm" ,glibmm-2.64)
       ("pango" ,pango)))))

(define-public atkmm
  (package
    (name "atkmm")
    (version "2.28.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version)  "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "0fnxrspxkhhbrjphqrpvl3zjm66n50s4cywrrrwkhbflgy8zqk2c"))))
    (build-system glib-or-gtk-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'move-doc
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (doc (assoc-ref outputs "doc")))
               (mkdir-p (string-append doc "/share"))
               (rename-file
                (string-append out "/share/doc")
                (string-append doc "/share/doc"))
               #t))))))
    (native-inputs
     `(("dot" ,graphviz)
       ("doxygen" ,doxygen)
       ("m4" ,m4)
       ("mm-common" ,mm-common)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("xsltproc" ,libxslt)))
    (propagated-inputs
     `(("atk" ,atk)
       ("glibmm" ,glibmm-2.64)))
    (synopsis "C++ bindings for ATK")
    (description "ATKmm is the C++ binding for the ATK library.")
    (home-page "https://wiki.gnome.org/Accessibility")
    (license
     (list
      ;; Library
      license:lgpl2.1+
      ;; Tools
      license:gpl2+))))

(define-public gtkmm
  (package
    (name "gtkmm")
    (version "3.24.2")
    (source (origin
             (method url-fetch)
             (uri (string-append "mirror://gnome/sources/" name "/"
                                 (version-major+minor version)  "/"
                                 name "-" version ".tar.xz"))
             (sha256
              (base32
               "1hxdnhavjyvbcpxhd5z17l9fj4182028s66lc0s16qqqrldhjwbd"))))
    (build-system gnu-build-system)
    (native-inputs `(("pkg-config" ,pkg-config)
                     ("glib" ,glib "bin")        ;for 'glib-compile-resources'
                     ("xorg-server" ,xorg-server-for-tests)))
    (propagated-inputs
     `(("pangomm" ,pangomm)
       ("cairomm" ,cairomm)
       ("atkmm" ,atkmm)
       ("gtk+" ,gtk+)
       ("glibmm" ,glibmm)))
    (arguments
     `(#:disallowed-references (,xorg-server-for-tests)
       #:phases (modify-phases %standard-phases
                  (add-before 'check 'run-xvfb
                    (lambda* (#:key inputs #:allow-other-keys)
                      (let ((xorg-server (assoc-ref inputs "xorg-server")))
                        ;; Tests such as 'object_move/test' require a running
                        ;; X server.
                        (system (string-append xorg-server "/bin/Xvfb :1 &"))
                        (setenv "DISPLAY" ":1")
                        ;; Don't fail because of the missing /etc/machine-id.
                        (setenv "DBUS_FATAL_WARNINGS" "0")
                        #t))))))
    (home-page "https://gtkmm.org/")
    (synopsis
     "C++ interface to the GTK+ graphical user interface library")
    (description
     "gtkmm is the official C++ interface for the popular GUI library GTK+.
Highlights include typesafe callbacks, and a comprehensive set of widgets that
are easily extensible via inheritance.  You can create user interfaces either
in code or with the Glade User Interface designer, using libglademm.  There's
extensive documentation, including API reference and a tutorial.")
    (license license:lgpl2.1+)))


(define-public gtkmm-2
  (package (inherit gtkmm)
    (name "gtkmm")
    (version "2.24.5")
    (source (origin
             (method url-fetch)
             (uri (string-append "mirror://gnome/sources/" name "/"
                                 (version-major+minor version)  "/"
                                 name "-" version ".tar.xz"))
             (sha256
              (base32
               "0wkbzvsx4kgw16f6xjdc1dz7f77ldngdila4yi5lw2zrgcxsb006"))))
    (arguments '())
    (native-inputs `(("pkg-config" ,pkg-config)))
    (propagated-inputs
     `(("pangomm" ,pangomm)
       ("cairomm" ,cairomm)
       ("atkmm" ,atkmm)
       ("gtk+" ,gtk+-2)
       ("glibmm" ,glibmm)))))

(define-public gtksourceviewmm
  (package
    (name "gtksourceviewmm")
    (version "3.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/" name "/"
                                  (version-major+minor version)  "/"
                                  name "-" version ".tar.xz"))
              (sha256
               (base32 "0fgvmhm4h4qmxig87qvangs6ijw53mi40siz7pixlxbrsgiil22i"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (propagated-inputs
     ;; In 'Requires' of gtksourceviewmm-3.0.pc.
     `(("glibmm" ,glibmm)
       ("gtkmm" ,gtkmm)
       ("gtksourceview" ,gtksourceview-3)))
    (synopsis "C++ interface to the GTK+ 'GtkTextView' widget")
    (description
     "gtksourceviewmm is a portable C++ library that extends the standard GTK+
framework for multiline text editing with support for configurable syntax
highlighting, unlimited undo/redo, search and replace, a completion framework,
printing and other features typical of a source code editor.")
    (license license:lgpl2.1+)
    (home-page "https://developer.gnome.org/gtksourceview/")))

;;;
;;; Python bindings.
;;;

(define-public python-pycairo
  (package
    (name "python-pycairo")
    (version "1.19.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "https://github.com/pygobject/pycairo/releases/download/v"
                          version "/pycairo-" version ".tar.gz"))
      (sha256
       (base32
        "111fav9m1iagw3nh2ws2vzkjh34r97yl7rdlpvsngsqg521k251c"))))
    (build-system python-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("python-pytest" ,python-pytest)))
    (propagated-inputs                  ;pycairo.pc references cairo
     `(("cairo" ,cairo)))
    (home-page "https://cairographics.org/pycairo/")
    (synopsis "Python bindings for cairo")
    (description
     "Pycairo is a set of Python bindings for the Cairo graphics library.")
    (license license:lgpl3+)
    (properties `((python2-variant . ,(delay python2-pycairo))))))

;; Pycairo no longer supports Python 2 since version 1.19.0, so we stick
;; with this older version here.
(define-public python2-pycairo
  (let ((pycairo (package-with-python2
                  (strip-python2-variant python-pycairo))))
    (package
      (inherit pycairo)
      (version "1.18.2")
      (source (origin
                (method url-fetch)
                (uri (string-append "https://github.com/pygobject/pycairo/releases"
                                    "/download/v" version "/pycairo-" version ".tar.gz"))
                (sha256
                 (base32
                  "0cb5n4r4nl0k1g90b1gz9iyk4lp7hi03db98i1p52a870bym7f6w"))))
      ;; Dual-licensed under LGPL 2.1 or Mozilla Public License 1.1
      (license (list license:lgpl2.1 license:mpl1.1)))))

(define-public python2-pygtk
  (package
    (name "python2-pygtk")
    (version "2.24.0")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "mirror://gnome/sources"
                          "/pygtk/" (version-major+minor version)
                          "/pygtk-" version ".tar.bz2"))
      (sha256
       (base32
        "04k942gn8vl95kwf0qskkv6npclfm31d78ljkrkgyqxxcni1w76d"))))
    (build-system gnu-build-system)
    (outputs '("out"
               "doc"))                            ;13 MiB of gtk-doc HTML
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("python" ,python-2)

       ;; XXX: The package fails to build with the latest Pango (propagated
       ;; from GTK+2), so we provide it with this older version.
       ("pango" ,pango-1.42)

       ("libglade" ,libglade)
       ("glib"   ,glib)))
    (propagated-inputs
     `(("python-pycairo"   ,python2-pycairo)     ;loaded at runtime
       ("python-pygobject" ,python2-pygobject-2) ;referenced in pc file
       ("gtk+"             ,gtk+-2)))
    (arguments
     `(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (add-before 'configure 'set-gtk-doc-directory
                    (lambda* (#:key outputs #:allow-other-keys)
                      ;; Install documentation to "doc".
                      (let ((doc (assoc-ref outputs "doc")))
                        (substitute* "docs/Makefile.in"
                          (("TARGET_DIR = \\$\\(datadir\\)")
                           (string-append "TARGET_DIR = " doc))))))
                  (add-after 'configure 'fix-codegen
                    (lambda* (#:key inputs #:allow-other-keys)
                      (substitute* "pygtk-codegen-2.0"
                        (("^prefix=.*$")
                         (string-append
                          "prefix="
                          (assoc-ref inputs "python-pygobject") "\n")))))
                  (add-after 'install 'install-pth
                    (lambda* (#:key inputs outputs #:allow-other-keys)
                      ;; pygtk's modules are stored in a subdirectory of
                      ;; python's site-packages directory.  Add a .pth file so
                      ;; that python will add that subdirectory to its module
                      ;; search path.
                      (let* ((out    (assoc-ref outputs "out"))
                             (site   (string-append out "/lib/python"
                                                    ,(version-major+minor
                                                      (package-version python-2))
                                                    "/site-packages")))
                        (call-with-output-file (string-append site "/pygtk.pth")
                          (lambda (port)
                            (format port "gtk-2.0~%")))))))))
    (home-page "http://www.pygtk.org/")
    (synopsis "Python bindings for GTK+")
    (description
     "PyGTK allows you to write full featured GTK programs in Python.  It is
targeted at GTK 2.x, and can be used in conjunction with gnome-python to
write GNOME applications.")
    (license license:lgpl2.1+)))

(define-public perl-cairo
  (package
    (name "perl-cairo")
    (version "1.107")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/X/XA/XAOC/Cairo-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0sg1gf1f2pjq7pji0zsv4rbi3bzpsx82z98k7yqxafzrvlkf27ay"))))
    (build-system perl-build-system)
    (native-inputs
     `(("perl-extutils-depends" ,perl-extutils-depends)
       ("perl-extutils-pkgconfig" ,perl-extutils-pkgconfig)))
    (inputs
     `(("cairo" ,cairo)))
    (home-page "https://metacpan.org/release/Cairo")
    (synopsis "Perl interface to the cairo 2d vector graphics library")
    (description "Cairo provides Perl bindings for the vector graphics library
cairo.  It supports multiple output targets, including PNG, PDF and SVG.  Cairo
produces identical output on all those targets.")
    (license license:lgpl2.1+)))

(define-public perl-gtk2
  (package
    (name "perl-gtk2")
    (version "1.24993")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://cpan/authors/id/X/XA/XAOC/Gtk2-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0ry9jfvfgdwzalxcvwsgr7plhk3agx7p40l0fqdf3vrf7ds47i29"))))
    (build-system perl-build-system)
    (native-inputs
     `(("perl-extutils-depends" ,perl-extutils-depends)
       ("perl-extutils-pkgconfig" ,perl-extutils-pkgconfig)))
    (inputs
     `(("gtk+" ,gtk+-2)))
    (propagated-inputs
     `(("perl-pango" ,perl-pango)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'build 'remove-broken-test
           ;; See https://gitlab.gnome.org/GNOME/perl-gtk2/issues/3.
           (lambda _
             (substitute* "t/GdkPixbuf.t"
               (("tests => 112") "tests => 111")
               (("ok \\(defined \\$pixbuf, \"Don't crash on partial pixmap data\"\\);")
                "# ok (defined $pixbuf, \"Don't crash on partial pixmap data\");")))))))
    (home-page "https://metacpan.org/release/Gtk2")
    (synopsis "Perl interface to the 2.x series of the Gimp Toolkit library")
    (description "Perl bindings to the 2.x series of the Gtk+ widget set.
This module allows you to write graphical user interfaces in a Perlish and
object-oriented way, freeing you from the casting and memory management in C,
yet remaining very close in spirit to original API.")
    (license license:lgpl2.1+)))

(define-public perl-pango
  (package
    (name "perl-pango")
    (version "1.227")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://cpan/authors/id/X/XA/XAOC/Pango-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0wdcidnfnb6nm79fzfs39ivawj3x8m98a147fmcxgv1zvwia9c1l"))))
    (build-system perl-build-system)
    (native-inputs
     `(("perl-extutils-depends" ,perl-extutils-depends)
       ("perl-extutils-pkgconfig" ,perl-extutils-pkgconfig)))
    (inputs
     `(("pango" ,pango)))
    (propagated-inputs
     `(("perl-cairo" ,perl-cairo)
       ("perl-glib" ,perl-glib)))
    (home-page "https://metacpan.org/release/Pango")
    (synopsis "Layout and render international text")
    (description "Pango is a library for laying out and rendering text, with an
emphasis on internationalization.  Pango can be used anywhere that text layout
is needed, but using Pango in conjunction with Cairo and/or Gtk2 provides a
complete solution with high quality text handling and graphics rendering.

Dynamically loaded modules handle text layout for particular combinations of
script and font backend.  Pango provides a wide selection of modules, including
modules for Hebrew, Arabic, Hangul, Thai, and a number of Indic scripts.
Virtually all of the world's major scripts are supported.

In addition to the low level layout rendering routines, Pango includes
@code{Pango::Layout}, a high level driver for laying out entire blocks of text,
and routines to assist in editing internationalized text.")
    (license license:lgpl2.1+)))

(define-public girara
  (package
    (name "girara")
    (version "0.3.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.pwmt.org/pwmt/girara")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08rpw9hkaprm4r853xy1d35i2af1pji8c3mzzl01mmwmyr9p0x8k"))))
    (native-inputs `(("pkg-config" ,pkg-config)
                     ("check" ,check)
                     ("gettext" ,gettext-minimal)
                     ("glib:bin" ,glib "bin")
                     ("xorg-server" ,xorg-server-for-tests)))
    ;; Listed in 'Requires.private' of 'girara.pc'.
    (propagated-inputs `(("gtk+" ,gtk+)))
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (add-before 'check 'start-xserver
                    ;; Tests require a running X server.
                    (lambda* (#:key inputs #:allow-other-keys)
                      (let ((xorg-server (assoc-ref inputs "xorg-server"))
                            (display ":1"))
                        (setenv "DISPLAY" display)

                        ;; On busy machines, tests may take longer than
                        ;; the default of four seconds.
                        (setenv "CK_DEFAULT_TIMEOUT" "20")

                        ;; Don't fail due to missing '/etc/machine-id'.
                        (setenv "DBUS_FATAL_WARNINGS" "0")
                        (zero? (system (string-append xorg-server "/bin/Xvfb "
                                                      display " &")))))))))
    (build-system meson-build-system)
    (home-page "https://pwmt.org/projects/girara/")
    (synopsis "Library for minimalistic gtk+3 user interfaces")
    (description "Girara is a library that implements a user interface that
focuses on simplicity and minimalism.  Currently based on GTK+, a
cross-platform widget toolkit, it provides an interface that focuses on three
main components: a so-called view widget that represents the actual
application, an input bar that is used to execute commands of the
application and the status bar which provides the user with current
information.")
    (license license:zlib)))

(define-public gtk-doc
  (package
    (name "gtk-doc")
    (version "1.32")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://gnome/sources/" name "/"
                       (version-major+minor version) "/"
                       name "-" version ".tar.xz"))
       (sha256
        (base32 "0z4h1dggpimygdp719l457jvqilps4qcfpk31jmj3jqpzcsg03ny"))))
    (build-system glib-or-gtk-build-system)
    (outputs '("out" "help"))
    (arguments
     `(#:configure-flags
       (list
        (string-append "--with-xml-catalog="
                       (assoc-ref %build-inputs "docbook-xml")
                       "/xml/dtd/docbook/catalog.xml")
        (string-append "--with-help-dir="
                       (assoc-ref %outputs "help")
                       "/share/help"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-gtk-doc-scan
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "gtk-doc.xsl"
               (("http://docbook.sourceforge.net/release/xsl/current/html/chunk.xsl")
                (string-append (assoc-ref inputs "docbook-xsl")
                               "/xml/xsl/docbook-xsl-"
                               ,(package-version docbook-xsl)
                               "/html/chunk.xsl"))
               (("http://docbook.sourceforge.net/release/xsl/current/common/en.xml")
                (string-append (assoc-ref inputs "docbook-xsl")
                               "/xml/xsl/docbook-xsl-"
                               ,(package-version docbook-xsl)
                               "/common/en.xml")))
             #t))
         (add-after 'unpack 'disable-failing-tests
           (lambda _
             (substitute* "tests/Makefile.in"
               (("annotations.sh bugs.sh empty.sh fail.sh gobject.sh program.sh")
                ""))
             #t))
         (add-before 'configure 'fix-docbook
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "configure"
               ;; The configure check is overzealous about making sure that
               ;; things are in place -- it uses the xmlcatalog tool to make
               ;; sure that docbook-xsl is available, but this tool can only
               ;; look in one catalog file, unlike the $XML_CATALOG_FILES
               ;; variable that Guix defines.  Fool the test by using the
               ;; docbook-xsl catalog explicitly and get on with life.
               (("\"\\$XML_CATALOG_FILE\" \
\"http://docbook.sourceforge.net/release/xsl/")
                (string-append (car (find-files (assoc-ref inputs "docbook-xsl")
                                                "^catalog.xml$"))
                               " \"http://docbook.sourceforge.net/release/xsl/")))
             #t))
         (add-before 'build 'set-HOME
           (lambda _
             ;; FIXME: dblatex with texlive-union does not find the built
             ;; metafonts, so it tries to generate them in HOME.
             (setenv "HOME" "/tmp")
             #t))
         (add-after 'install 'wrap-executables
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (for-each (lambda (prog)
                           (wrap-program prog
                             `("PYTHONPATH" ":" prefix (,(getenv "PYTHONPATH")))))
                         (find-files (string-append out "/bin")))
               #t))))))
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("glib:bin" ,glib "bin")
       ("gobject-introspection" ,gobject-introspection)
       ("itstool" ,itstool)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)))
    (inputs
     `(("bc" ,bc)
       ("dblatex" ,dblatex)
       ("docbook-xml" ,docbook-xml-4.3)
       ("docbook-xsl" ,docbook-xsl)
       ("glib" ,glib)
       ("libxml2" ,libxml2)
       ("libxslt" ,libxslt)
       ("python" ,python)
       ("python-anytree" ,python-anytree)
       ("python-lxml" ,python-lxml)
       ("python-parameterized" ,python-parameterized)
       ("python-pygments" ,python-pygments)
       ("python-unittest2" ,python-unittest2)
       ("source-highlight" ,source-highlight)
       ("yelp-tools" ,yelp-tools)))
    (synopsis "GTK+ DocBook Documentation Generator")
    (description "GtkDoc is a tool used to extract API documentation from C-code
like Doxygen, but handles documentation of GObject (including signals and
properties) that makes it very suitable for GTK+ apps and libraries.  It uses
docbook for intermediate files and can produce html by default and pdf/man-pages
with some extra work.")
    (home-page "https://wiki.gnome.org/DocumentationProject/GtkDoc")
    (license
     (list
      ;; Docs.
      license:fdl1.1+
      ;; Others.
      license:gpl2+))))

(define-public gtk-engines
  (package
    (name "gtk-engines")
    (version "2.20.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/" name "/"
                                  (version-major+minor version) "/"
                                  name "-" version ".tar.bz2"))
              (sha256
               (base32
                "1db65pb0j0mijmswrvpgkdabilqd23x22d95hp5kwxvcramq1dhm"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       `("--enable-animation")))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("intltool" ,intltool)))
    (inputs
     ;; Don't propagate GTK+ to reduce "profile pollution".
     `(("gtk+" ,gtk+-2))) ; required by gtk-engines-2.pc
    (home-page "https://live.gnome.org/GnomeArt")
    (synopsis "Theming engines for GTK+ 2.x")
    (description
     "This package contains the standard GTK+ 2.x theming engines including
Clearlooks, Crux, High Contrast, Industrial, LighthouseBlue, Metal, Mist,
Redmond95 and ThinIce.")
    (license (list license:gpl2+ license:lgpl2.1+))))

(define-public murrine
  (package
    (name "murrine")
    (version "0.98.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/" name "/"
                                  (version-major+minor version) "/"
                                  name "-" version ".tar.xz"))
              (sha256
               (base32
                "129cs5bqw23i76h3nmc29c9mqkm9460iwc8vkl7hs4xr07h8mip9"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       `("--enable-animation"
         "--enable-animationrtl")))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("intltool" ,intltool)))
    (propagated-inputs
     `(("gtk+" ,gtk+-2)))
    (home-page "https://live.gnome.org/GnomeArt")
    (synopsis "Cairo-based theming engine for GTK+ 2.x")
    (description
     "Murrine is a cairo-based GTK+ theming engine.  It is named after the
glass artworks done by Venicians glass blowers.")
    (license license:gpl2+)))

(define-public gtkspell3
  (package
    (name "gtkspell3")
    (version "3.0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/gtkspell/"
                                  version "/" name "-" version ".tar.xz"))
              (sha256
               (base32
                "0cjp6xdcnzh6kka42w9g0w2ihqjlq8yl8hjm9wsfnixk6qwgch5h"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("intltool" ,intltool)
       ("pkg-config" ,pkg-config)
       ("vala" ,vala)))
    (inputs
     `(("gobject-introspection" ,gobject-introspection)
       ("gtk+" ,gtk+)
       ("pango" ,pango)))
    (propagated-inputs
     `(("enchant" ,enchant)))           ; gtkspell3-3.0.pc refers to it
    (home-page "http://gtkspell.sourceforge.net")
    (synopsis "Spell-checking addon for GTK's TextView widget")
    (description
     "GtkSpell provides word-processor-style highlighting and replacement of
misspelled words in a GtkTextView widget.")
    (license license:gpl2+)))

(define-public clipit
  (package
    (name "clipit")
    (version "1.4.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/CristianHenzel/ClipIt")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05xi29v2y0rvb33fmvrz7r9j4l858qj7ngwd7dp4pzpkkaybjln0"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("intltool" ,intltool)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("gtk+" ,gtk+-2)))
    (home-page "https://github.com/CristianHenzel/ClipIt")
    (synopsis "Lightweight GTK+ clipboard manager")
    (description
     "ClipIt is a clipboard manager with features such as a history, search
thereof, global hotkeys and clipboard item actions.  It was forked from
Parcellite and adds bugfixes and features.")
    (license license:gpl2+)))

(define-public graphene
  (package
    (name "graphene")
    (version "1.10.0")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/ebassi/graphene.git")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14a0j1rvjlc7yhfdmhmckdmkzy4ch61qbzywdlw1xv58h23wx29p"))))
    (build-system meson-build-system)
    (arguments
     `(#:glib-or-gtk? #t     ; To wrap binaries and/or compile schemas
       #:configure-flags
       (list
        "-Dinstalled_tests=false")))
    (native-inputs
     `(("git" ,git-minimal)
       ("gobject-introspection" ,gobject-introspection)
       ("mutest" ,mutest)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("glib" ,glib)
       ("python" ,python)))
    (synopsis "Thin layer of graphic data types")
    (description "Graphene provides graphic types and their relative API; it
does not deal with windowing system surfaces, drawing, scene graphs, or input.")
    (home-page "https://ebassi.github.io/graphene/")
    (license license:expat)))

(define-public spread-sheet-widget
  (package
    (name "spread-sheet-widget")
    (version "0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://alpha.gnu.org/gnu/ssw/"
                           "spread-sheet-widget-" version ".tar.gz"))
       (sha256
        (base32 "08ck9l697xg8vpya5h07raq837i4pqxjqzx30vhscq4xpps2b8kj"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("glib" ,glib "bin")             ; for glib-genmarshal, etc.
       ("pkg-config" ,pkg-config)))
    ;; In 'Requires' of spread-sheet-widget.pc.
    (propagated-inputs
     `(("glib" ,glib)
       ("gtk+" ,gtk+)))
    (home-page "https://www.gnu.org/software/ssw/")
    (synopsis "Gtk+ widget for dealing with 2-D tabular data")
    (description
     "GNU Spread Sheet Widget is a library for Gtk+ which provides a widget for
viewing and manipulating 2 dimensional tabular data in a manner similar to many
popular spread sheet programs.")
    (license license:gpl3+)))

(define-public volumeicon
  (package
    (name "volumeicon")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://nullwise.com/files/volumeicon/volumeicon-"
                           version ".tar.gz"))
       (sha256
        (base32 "182xl2w8syv6ky2h2bc9imc6ap8pzh0p7rp63hh8nw0xm38c3f14"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (list "--enable-notify")))       ; optional libnotify support
    (native-inputs
     `(("intltool" ,intltool)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("gtk+" ,gtk+)
       ("libnotify" ,libnotify)))
    (home-page "http://nullwise.com/volumeicon.html")
    (synopsis "System tray volume applet")
    (description
     "Volume Icon is a volume indicator and control applet for @acronym{the
Advanced Linux Sound Architecture, ALSA}.  It sits in the system tray,
independent of your desktop environment, and supports global key bindings.")
    (license (list license:expat        ; src/{bind.c,keybinder.h}
                   license:isc          ; src/alsa_volume_mapping.c
                   license:gpl3))))     ; the rest & combined work

(define-public yad
  (package
    (name "yad")
    (version "5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/v1cont/yad")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07rd61hvilsxxrj7lf8c9k0a8glj07s48m7ya8d45030r90g3lvc"))))
    (build-system glib-or-gtk-build-system)
    (arguments
     `(#:configure-flags
       ;; Passing --enable-foo will silently disable foo if prerequisite
       ;; inputs are missing, not abort the build as one might expect.
       ;; ‘--enable-html’ adds a huge webkitgtk dependency.  It was never
       ;; present in the past and nobody complained.
       '("--enable-icon-browser"
         "--enable-spell")              ; gspell checking support
       #:phases
       (modify-phases %standard-phases
         (add-after 'bootstrap 'intltoolize
           (lambda _
             (invoke "intltoolize" "--force" "--automake"))))))
    (inputs
     `(("gspell" ,gspell)
       ("gtk+" ,gtk+)))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("intltool" ,intltool)
       ("pkg-config" ,pkg-config)))
    (home-page "https://sourceforge.net/projects/yad-dialog/")
    (synopsis "GTK+ dialog boxes for shell scripts")
    (description
     "This program allows you to display GTK+ dialog boxes from command line or
shell scripts.  Example of how to use @code{yad} can be consulted at
@url{https://sourceforge.net/p/yad-dialog/wiki/browse_pages/}.")
    (license license:gpl3+)))

(define-public libdbusmenu
  (package
    (name "libdbusmenu")
    (version "16.04.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://launchpad.net/libdbusmenu/"
                           (version-major+minor version) "/" version
                           "/+download/libdbusmenu-" version ".tar.gz"))
       (sha256
        (base32 "12l7z8dhl917iy9h02sxmpclnhkdjryn08r8i4sr8l3lrlm4mk5r"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       '("--sysconfdir=/etc"
         "--localstatedir=/var"
         ;; The shebang of the generated test files should be patched before
         ;; enabling tests.
         "--disable-tests")
       #:make-flags
       `(,(string-append "typelibdir=" (assoc-ref %outputs "out")
                         "/lib/girepository-1.0"))
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'do-not-treat-warnings-as-errors
           (lambda _
             ;; Prevent the build from failing due to deprecation warnings
             ;; from newer GLib and GTK versions.
             (substitute* (find-files "." "^Makefile.in$")
               ((" -Werror")
                ""))
             #t))
         (add-before 'configure 'set-environment
           (lambda _
             (setenv "HAVE_VALGRIND_TRUE" "")
             (setenv "HAVE_VALGRIND_FALSE" "#")
             #t)))))
    (inputs
     `(("glib" ,glib)
       ("gtk+" ,gtk+)
       ("gtk+-2" ,gtk+-2)))
    (native-inputs
     `(("glib:bin" ,glib "bin")
       ("gnome-doc-utils" ,gnome-doc-utils)
       ("gobject-introspection" ,gobject-introspection)
       ("intltool" ,intltool)
       ("json-glib" ,json-glib)
       ("pkg-config" ,pkg-config)
       ("python" ,python-2)
       ("vala" ,vala)))
    (home-page "https://launchpad.net/libdbusmenu")
    (synopsis "Library for passing menus over DBus")
    (description "@code{libdbusmenu} passes a menu structure across DBus so
that a program can create a menu simply without worrying about how it is
displayed on the other side of the bus.")

    ;; Dual-licensed under either LGPLv2.1 or LGPLv3.
    (license (list license:lgpl2.1 license:lgpl3))))

(define-public gtk-layer-shell
  (package
    (name "gtk-layer-shell")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/wmww/gtk-layer-shell/releases/download/v"
             version "/gtk-layer-shell-" version ".tar.xz"))
       (sha256
        (base32 "0ncklk3z0fzlz6p76jdcrr1ykyp1f4ykjjch4x2hfp9bwsnl4a3m"))))
    (build-system meson-build-system)
    (native-inputs `(("pkg-config" ,pkg-config)
                     ("gobject-introspection" ,gobject-introspection)))
    (inputs `(("wayland" ,wayland)
              ("gtk+" ,gtk+)))
    (home-page "https://github.com/wmww/gtk-layer-shell")
    (synopsis "Library to create Wayland desktop components using the Layer
Shell protocol")
    (description "Layer Shell is a Wayland protocol for desktop shell
components, such as panels, notifications and wallpapers.  It can be used to
anchor windows to a corner or edge of the output, or stretch them across the
entire output.  It supports all Layer Shell features including popups and
popovers.")
    (license license:expat)))

(define-public goocanvas
  (package
    (name "goocanvas")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://gnome/sources/goocanvas/"
                           (version-major+minor version)
                           "/goocanvas-" version ".tar.xz"))
       (sha256
        (base32 "141fm7mbqib0011zmkv3g8vxcjwa7hypmq71ahdyhnj2sjvy4a67"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("glib-bin" ,glib "bin")
       ("gobject-introspection" ,gobject-introspection)
       ("gtk-doc" ,gtk-doc)
       ("pkg-config" ,pkg-config)
       ("python" ,python)))
    (inputs
     `(("cairo" ,cairo)
       ("glib" ,glib)
       ("gtk+" ,gtk+)
       ("python-pygobject" ,python-pygobject)))
    (arguments
     `(#:configure-flags '("--disable-rebuilds"
                           "--disable-static")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-install-path
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (substitute* "configure"
               (("\\(gi._overridesdir\\)")
                (string-append "((gi._overridesdir).replace(\\\""
                               (assoc-ref inputs "python-pygobject")
                               "\\\", \\\""
                               (assoc-ref outputs "out")
                               "\\\"))")))
             #t)))))
    (synopsis "Canvas widget for GTK+")
    (description "GooCanvas is a canvas widget for GTK+ that uses the cairo 2D
library for drawing.")
    (home-page "https://wiki.gnome.org/GooCanvas")
    (license license:lgpl2.0)))

(define-public gtksheet
  (package
    (name "gtksheet")
    (version "4.3.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fpaquet/gtksheet")
             (commit (string-append "V" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "10qzmdkjkkvkcadxn019cbyhwaahxcfv1apv54lc711bqvh63v8r"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags (list "--enable-glade"
                               "--enable-introspection")
       #:phases
       (modify-phases %standard-phases
         ;; The "configure" script is present, but otherwise the project is
         ;; not bootstrapped properly. Delete configure so the bootstrap phase
         ;; will take over.
         (add-after 'unpack 'delete-configure
           (lambda _
             (delete-file "configure")
             #t))
         ;; Fix glade install directories.
         (add-before 'bootstrap 'configure-glade-directories
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "configure.ac"
               (("`\\$PKG_CONFIG --variable=catalogdir gladeui-2.0`")
                (string-append (assoc-ref outputs "out") "/share/glade/catalogs"))
               (("`\\$PKG_CONFIG --variable=moduledir gladeui-2.0`")
                (string-append (assoc-ref outputs "out") "/lib/glade/modules"))
               (("`\\$PKG_CONFIG --variable=pixmapdir gladeui-2.0`")
                (string-append (assoc-ref outputs "out") "/share/pixmaps")))
             #t))
         ;; Fix incorrect typelib version. This is a known upstream bug. See
         ;; https://github.com/fpaquet/gtksheet/issues/23
         (add-after 'install 'fix-typelib-version
           (lambda* (#:key outputs #:allow-other-keys)
             (with-directory-excursion (string-append (assoc-ref outputs "out")
                                                      "/lib/girepository-1.0")
               (rename-file "GtkSheet-4.0.typelib"
                            (string-append "GtkSheet-" ,version ".typelib")))
             #t)))))
    (inputs
     `(("glade" ,glade3)
       ("glib" ,glib)
       ("gtk+" ,gtk+)
       ("libxml2" ,libxml2)))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("gobject-introspection" ,gobject-introspection)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)))
    (home-page "https://fpaquet.github.io/gtksheet/")
    (synopsis "Spreadsheet widget for GTK+")
    (description "GtkSheet is a matrix widget for GTK+.  It consists of an
scrollable grid of cells where you can allocate text.  Cell contents can be
edited interactively through a specially designed entry, GtkItemEntry.  It is
also a container subclass, allowing you to display buttons, images and any
other widget in it.  You can also set many attributes such as border,
foreground and background colors, text justification and more.")
    (native-search-paths
     (list
      (search-path-specification
       (variable "GLADE_CATALOG_SEARCH_PATH")
       (files '("share/glade/catalogs")))
      (search-path-specification
       (variable "GLADE_MODULE_SEARCH_PATH")
       (files '("lib/glade/modules")))))
    (license license:lgpl2.0+)))
