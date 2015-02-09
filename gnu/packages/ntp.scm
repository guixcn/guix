;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2014 John Darrington <jmd@gnu.org>
;;; Copyright © 2014, 2015 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2015 Taylan Ulrich Bayırlı/Kammer <taylanbayirli@gmail.com>
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

(define-module (gnu packages ntp)
  #:use-module (gnu packages)
  #:use-module (gnu packages which)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages openssl)
  #:use-module ((guix licenses) #:prefix l:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (srfi srfi-1))

(define-public ntp
  (package
   (name "ntp")
   (version "4.2.8p1")
   (source (origin
	    (method url-fetch)
	    (uri (string-append 
                  "http://archive.ntp.org/ntp4/ntp-"
                  (version-major+minor version)
                  "/ntp-" version ".tar.gz"))
	    (sha256
	     (base32
	      "124xslljdzv778msr18jn5l9d6fhvzpsmmnfczc05l0yiyw790ll"))))
   (native-inputs `(("which" ,which)
                    ("pkg-config" ,pkg-config)))
   (inputs
    `(("openssl" ,openssl)
      ;; Build with POSIX capabilities support on GNU/Linux.  This allows 'ntpd'
      ;; to run as non-root (when invoked with '-u'.)
      ,@(if (string-suffix? "-linux"
                            (or (%current-target-system) (%current-system)))
            `(("libcap" ,libcap))
            '())))
   (build-system gnu-build-system)
   (synopsis "Real time clock synchonization system")
   (description "NTP is a system designed to synchronize the clocks of
computers over a network.")
   (license (l:x11-style
             "http://www.eecis.udel.edu/~mills/ntp/html/copyright.html"
             "A non-copyleft free licence from the University of Delaware"))
   (home-page "http://www.ntp.org")))

(define-public openntpd
  (package
    (name "openntpd")
    (version "5.7p3")
    (source (origin
              (method url-fetch)
              ;; XXX Use mirror://openbsd
              (uri (string-append
                    "http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/openntpd-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0filjmb3b8rc39bvhm8q2azzj10ljfgq41qih71pxv919j57qhag"))))
    (build-system gnu-build-system)
    (home-page "http://www.openntpd.org/")
    (synopsis "NTP client and server by the OpenBSD Project")
    (description "OpenNTPD is the OpenBSD Project's implementation of a client
and server for the Network Time Protocol.  Its design goals include being
secure, easy to configure, and accurate enough for most purposes, so it's more
minimalist than ntpd.")
    ;; A few of the source files are under bsd-3.
    (license (list l:isc l:bsd-3))))
