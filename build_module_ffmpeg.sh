#!/bin/bash

# $1 = architecture
# $2 = 1 - default compiler environment variables, 0 - none

. set_module_environment.sh $1 $2

oot="${BASEDIR}/build/${MODULE_ARCH}/oot/ffmpeg"
mkdir -p "$oot"
pushd "$oot"

case ${MODULE_ARCH} in
  armeabi-v7a | armeabi-v7a-neon)
    CPU='armv7-a'
	ASM='--enable-asm'
  ;;
  arm64-v8a)
    CPU='arm64'
    ;;
  x86)
    CPU='i686'
	ASM='--disable-asm --enable-pic'
  ;;
  x86_64)
    CPU='x86_64'
  	ASM='--disable-asm --enable-pic'
    ;;
esac

make distclean

"${BASEDIR}/ffmpeg/configure" \
--target-os="$TARGET_OS" \
--cross-prefix="$CROSS_PREFIX" \
--prefix="${BASEDIR}/build/${MODULE_ARCH}" \
--arch="$NDK_ABI" \
--cpu="$CPU" \
--enable-runtime-cpudetect \
--sysroot="$NDK_SYSROOT" \
$ASM \
--disable-debug \
--disable-symver \
--disable-ffplay \
--disable-ffprobe \
--disable-gpl \
--disable-doc \
--enable-version3 \
--enable-pthreads \
--enable-hardcoded-tables \
--disable-postproc \
--disable-bsfs \
--disable-indevs \
--disable-outdevs \
--disable-devices \
--disable-network \
--disable-filters \
--enable-filter=rotate \
--enable-filter=scale \
--enable-filter=anull \
--enable-filter=anullsrc \
--enable-filter=copy \
--enable-filter=crop \
--enable-filter=cropdetect \
--enable-filter=aresample \
 \
--disable-demuxers \
--enable-demuxer=aac \
--enable-demuxer=ac3 \
--enable-demuxer=acm \
--enable-demuxer=aiff \
--enable-demuxer=dvbsub \
--enable-demuxer=dvbtxt \
--enable-demuxer=srt \
--enable-demuxer=smjpeg \
--enable-demuxer=smush \
--enable-demuxer=image_psd_pipe \
--enable-demuxer=image_sgi_pipe \
--enable-demuxer=image_qdraw_pipe \
--enable-demuxer=image_svg_pipe \
--enable-demuxer=image_tiff_pipe \
--enable-demuxer=image_webp_pipe \
--enable-demuxer=image_xpm_pipe \
--enable-demuxer=image_sunrast_pipe \
--enable-demuxer=image_ppm_pipe \
--enable-demuxer=ogg \
--enable-demuxer=filmstrip \
--enable-demuxer=pcm_alaw \
--enable-demuxer=pcm_f32le \
--enable-demuxer=pcm_f64le \
--enable-demuxer=pcm_f64be \
--enable-demuxer=pcm_mulaw \
--enable-demuxer=pcm_s16be \
--enable-demuxer=pcm_s16le \
--enable-demuxer=pcm_s24be \
--enable-demuxer=pcm_s24le \
--enable-demuxer=pcm_s32be \
--enable-demuxer=pcm_s32le \
--enable-demuxer=pcm_s8 \
--enable-demuxer=pcm_u16be \
--enable-demuxer=pcm_u16le \
--enable-demuxer=pcm_u24be \
--enable-demuxer=pcm_u24le \
--enable-demuxer=pcm_u32be \
--enable-demuxer=pcm_u32le \
--enable-demuxer=pcm_f32be \
--enable-demuxer=pcm_u8 \
--enable-demuxer=ffmetadata \
--enable-demuxer=subviewer \
--enable-demuxer=subviewer1 \
--enable-demuxer=swf \
--enable-demuxer=ipmovie \
--enable-demuxer=amr \
--enable-demuxer=flv \
--enable-demuxer=iv8 \
--enable-demuxer=flac \
--enable-demuxer=flic \
--enable-demuxer=ivf \
--enable-demuxer=ivr \
--enable-demuxer=frm \
--enable-demuxer=fourxm \
--enable-demuxer=apng \
--enable-demuxer=iss \
--enable-demuxer=g722 \
--enable-demuxer=jv \
--enable-demuxer=live_flv \
--enable-demuxer=g723_1 \
--enable-demuxer=g729 \
--enable-demuxer=truehd \
--enable-demuxer=tty \
--enable-demuxer=v210 \
--enable-demuxer=v210x \
--enable-demuxer=vivo \
--enable-demuxer=vobsub \
--enable-demuxer=wav \
--enable-demuxer=webm_dash_manifest \
--enable-demuxer=webvtt \
--enable-demuxer=wsvqa \
--enable-demuxer=yuv4mpegpipe \
--enable-demuxer=rawvideo \
--enable-demuxer=m4v \
--enable-demuxer=matroska \
--enable-demuxer=mjpeg \
--enable-demuxer=mjpeg_2000 \
--enable-demuxer=mmf \
--enable-demuxer=mov \
--enable-demuxer=mp3 \
--enable-demuxer=mpc \
--enable-demuxer=mpc8 \
--enable-demuxer=asf \
--enable-demuxer=aqtitle \
--enable-demuxer=asf_o \
--enable-demuxer=ass \
--enable-demuxer=avi \
--enable-demuxer=au \
--enable-demuxer=avr \
--enable-demuxer=avs \
--enable-demuxer=gif \
--enable-demuxer=h261 \
--enable-demuxer=h263 \
--enable-demuxer=gsm \
--enable-demuxer=h264 \
--enable-demuxer=hevc \
--enable-demuxer=hls \
--enable-demuxer=ico \
--enable-demuxer=idf \
--enable-demuxer=iff \
--enable-demuxer=ilbc \
--enable-demuxer=image2 \
--enable-demuxer=image2_alias_pix \
--enable-demuxer=dts \
--enable-demuxer=dtshd \
--enable-demuxer=dsf \
--enable-demuxer=data \
--enable-demuxer=siff \
--enable-demuxer=mv \
--enable-demuxer=mtv \
--enable-demuxer=msf \
--enable-demuxer=mpegtsraw \
--enable-demuxer=mpegvideo \
--enable-demuxer=mpjpeg \
--enable-demuxer=mpegts \
--enable-demuxer=mpegps \
--enable-demuxer=image2pipe \
--enable-demuxer=image_bmp_pipe \
--enable-demuxer=image_j2k_pipe \
--enable-demuxer=image_jpeg_pipe \
--enable-demuxer=image_jpegls_pipe \
--enable-demuxer=image_png_pipe \
--enable-demuxer=image_pam_pipe \
--enable-demuxer=image_pbm_pipe \
--enable-demuxer=image_pcx_pipe \
--enable-demuxer=image_pgm_pipe \
--enable-demuxer=image_pgmyuv_pipe \
--enable-demuxer=image_pictor_pipe \
--enable-demuxer=image_dpx_pipe \
--enable-demuxer=image_dds_pipe \
--enable-demuxer=image_exr_pipe \
--enable-demuxer=image2_brender_pix \
 \
--disable-decoder=bethsoftvid \
--disable-decoder=evrc \
--disable-decoder=exr \
--disable-decoder=avrp \
--disable-decoder=avrn \
--disable-decoder=movtext \
--disable-decoder=fic \
--disable-decoder=bfi \
--disable-decoder=pgm \
--disable-decoder=pgmyuv \
--disable-decoder=pgssub \
--disable-decoder=pictor \
--disable-decoder=pixlet \
--disable-decoder=pjs \
--disable-decoder=pcx \
--disable-decoder=frwu \
--disable-decoder=g2m \
--disable-decoder=gdv \
--disable-decoder=gremlin_dpcm \
--disable-decoder=cavs \
--disable-decoder=c93 \
--disable-decoder=brender_pix \
--disable-decoder=bmv_audio \
--disable-decoder=bmv_video \
--disable-decoder=bintext \
--disable-decoder=bink \
--disable-decoder=binkaudio_rdft \
--disable-decoder=binkaudio_dct \
--disable-decoder=prores \
--disable-decoder=prores_lgpl \
--disable-decoder=cdgraphics \
--disable-decoder=ccaption \
--disable-decoder=mscc \
--disable-decoder=msa1 \
--disable-decoder=cdxl \
--disable-decoder=cfhd \
--disable-decoder=cljr \
--disable-decoder=cllc \
--disable-decoder=ptx \
--disable-decoder=qcelp \
--disable-decoder=qdm2 \
--disable-decoder=qdmc \
--disable-decoder=qpeg \
--disable-decoder=qtrle \
--disable-decoder=r10k \
--disable-decoder=r210 \
--disable-decoder=ra_144 \
--disable-decoder=ra_288 \
--disable-decoder=ralf \
--disable-decoder=roq \
--disable-decoder=roq_dpcm \
--disable-decoder=rpza \
--disable-decoder=rscc \
--disable-decoder=s302m \
--disable-decoder=sanm \
--disable-decoder=scpr \
--disable-decoder=screenpresso \
--disable-decoder=mszh \
--disable-decoder=mxpeg \
--disable-decoder=nellymoser \
--disable-decoder=nuv \
--disable-decoder=paf_audio \
--disable-decoder=paf_video \
--disable-decoder=hap \
--disable-decoder=hnm4_video \
--disable-decoder=idcin \
--disable-decoder=indeo2 \
--disable-decoder=indeo3 \
--disable-decoder=indeo4 \
--disable-decoder=indeo5 \
--disable-decoder=interplay_acm \
--disable-decoder=interplay_dpcm \
--disable-decoder=interplay_video \
--disable-decoder=jacosub \
--disable-decoder=comfortnoise \
--disable-decoder=cook \
--disable-decoder=cpia \
--disable-decoder=cscd \
--disable-decoder=dfa \
--disable-decoder=dirac \
--disable-decoder=dnxhd \
--disable-decoder=dsd_lsbf \
--disable-decoder=dsd_lsbf_planar \
--disable-decoder=dsd_msbf \
--disable-decoder=dsd_msbf_planar \
--disable-decoder=dsicinaudio \
--disable-decoder=dsicinvideo \
--disable-decoder=dss_sp \
--disable-decoder=dvaudio \
--disable-decoder=dst \
--disable-decoder=alias_pix \
--disable-decoder=sdx2_dpcm \
--disable-decoder=sgirle \
--disable-decoder=sheervideo \
--disable-decoder=shorten \
--disable-decoder=sipr \
--disable-decoder=smackaud \
--disable-decoder=smc \
--disable-decoder=smacker \
--disable-decoder=smvjpeg \
--disable-decoder=sol_dpcm \
--disable-decoder=sonic \
--disable-decoder=sp5x \
--disable-decoder=speedhq \
--disable-decoder=srgc \
--disable-decoder=xbin \
--disable-decoder=xface \
--disable-decoder=xl \
--disable-decoder=xma1 \
--disable-decoder=xma2 \
--disable-decoder=kgv1 \
--disable-decoder=kmvc \
--disable-decoder=lagarith \
--disable-decoder=loco \
--disable-decoder=m101 \
--disable-decoder=mace3 \
--disable-decoder=mace6 \
--disable-decoder=mdec \
--disable-decoder=mimic \
--disable-decoder=vb \
--disable-decoder=vble \
--disable-decoder=dxtory \
--disable-decoder=eamad \
--disable-decoder=eatgq \
--disable-decoder=eatgv \
--disable-decoder=eatqi \
--disable-decoder=eightbps \
--disable-decoder=eightsvx_exp \
--disable-decoder=eightsvx_fib \
--disable-decoder=escape124 \
--disable-decoder=escape130 \
--disable-decoder=tmv \
--disable-decoder=anm \
--disable-decoder=ape \
--disable-decoder=atrac1 \
--disable-decoder=atrac3 \
--disable-decoder=atrac3al \
--disable-decoder=atrac3p \
--disable-decoder=atrac3pal \
--disable-decoder=ssa \
--disable-decoder=subrip \
--disable-decoder=subviewer \
--disable-decoder=subviewer1 \
--disable-decoder=stl \
--disable-decoder=xsub \
--disable-decoder=xwd \
--disable-decoder=ylc \
--disable-decoder=yop \
--disable-decoder=zmbv \
--disable-decoder=wnv1 \
--disable-decoder=ws_snd1 \
--disable-decoder=xan_dpcm \
--disable-decoder=xan_wc3 \
--disable-decoder=xan_wc4 \
--disable-decoder=vmnc \
--disable-decoder=tscc \
--disable-decoder=tscc2 \
--disable-decoder=tta \
--disable-decoder=twinvq \
--disable-decoder=txd \
--disable-decoder=ulti \
--disable-decoder=utvideo \
--disable-decoder=sunrast \
--disable-decoder=tak \
--disable-decoder=targa \
--disable-decoder=targa_y216 \
--disable-decoder=tdsc \
--disable-decoder=text \
--disable-decoder=thp \
--disable-decoder=tiertexseqvideo \
 \
--disable-muxers \
--enable-muxer=mp4 \
--enable-muxer=h264 \
 \
--disable-encoders \
--enable-encoder=aac \
--enable-libopenh264 \
--enable-encoder=libopenh264 \
--enable-decoder=libopenh264 \
 \
--disable-protocols \
--enable-protocol=file,pipe \
--enable-small \
--pkg-config="${BASEDIR}/pkg-config-ffmpeg" \
--extra-cflags="-I${TOOLCHAIN_PREFIX}/include $CFLAGS" \
--extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $LDFLAGS" \
--extra-cxxflags="$CXX_FLAGS" || exit 1

make -j${NUMBER_OF_CORES} && make install || exit 1

popd
