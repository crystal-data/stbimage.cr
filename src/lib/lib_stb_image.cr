# Copyright (c) 2020 Crystal Data Contributors
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

@[Link(ldflags: "#{__DIR__}/../../ext/stb_image.o")]
@[Link(ldflags: "#{__DIR__}/../../ext/stb_image_write.o")]
lib LibStbImage
  enum Component
    Default   = 0
    Grey      = 1
    GreyAlpha = 2
    Rgb       = 3
    RgbAlpha  = 4
  end

  fun load = stbi_load(filename : LibC::Char*, x : Int32*, y : Int32*, comp : Int32*, req_comp : Int32) : LibC::Char*
  fun load_from_memory = stbi_load_from_memory(buffer : LibC::Char*, len : Int32, x : Int32*, y : Int32*, comp : Int32*, req_comp : Int32) : LibC::Char*

  fun loadf = stbi_loadf(filename : LibC::Char*, x : Int32*, y : Int32*, comp : Int32*, req_comp : Int32) : Float32*
  fun loadf_from_memory = stbi_loadf_from_memory(buffer : LibC::Char*, x : Int32*, y : Int32*, comp : Int32*, req_comp : Int32) : Float32*

  fun hdr_to_ldr_gamma = stbi_hdr_to_ldr_gamma(gamma : Float32)
  fun hdr_to_ldr_scale = stbi_hdr_to_ldr_scale(scale : Float32)

  fun ldr_to_hdr_gamma = stbi_ldr_to_hdr_gamma(gamma : Float32)
  fun ldr_to_hdr_scale = stbi_ldr_to_hdr_scale(scale : Float32)

  fun is_hdr = stbi_is_hdr(filename : LibC::Char*) : Int32
  fun is_hdr_from_memory = stbi_is_hdr_from_memory(buffer : LibC::Char*, len : Int32) : Int32

  fun failure_reason = stbi_failure_reason : LibC::Char*
  fun image_free = stbi_image_free(retval_from_stbi_load : Pointer(Void))

  fun info = stbi_info(filename : LibC::Char*, x : Int32*, y : Int32*, comp : Int32*) : Int32
  fun info_from_memory = stbi_info_from_memory(buffer : LibC::Char*, len : Int32, x : Int32*, y : Int32*, comp : Int32*) : Int32

  fun set_unpremultiply_on_load = stbi_set_unpremultiply_on_load(flag_true_if_should_unpremultiply : Int32)
  fun convert_iphone_png_to_rgb = stbi_convert_iphone_png_to_rgb(flag_true_if_should_convert : Int32)
  fun set_flip_vertically_on_load = stbi_set_flip_vertically_on_load(flag_true_if_should_flip : Int32)

  fun zlib_decode_malloc_guesssize = stbi_zlib_decode_malloc_guesssize(buffer : LibC::Char*, len : Int32, initial_size : Int32, outlen : Int32*) : LibC::Char*
  fun zlib_decode_malloc_guesssize = stbi_zlib_decode_malloc_guesssize_headerflag(buffer : LibC::Char*, len : Int32, initial_size : Int32, outlen : Int32*, parse_header : Int32) : LibC::Char*
  fun zlib_decode_malloc = stbi_zlib_decode_malloc(buffer : LibC::Char*, len : Int32, outlen : Int32*) : LibC::Char*
  fun zlib_decode_buffer = stbi_zlib_decode_buffer(obuffer : LibC::Char*, olen : Int32, ibuffer : LibC::Char*, ilen : Int32) : Int32
  fun zlib_decode_noheader_malloc = stbi_zlib_decode_noheader_malloc(buffer : LibC::Char*, len : Int32, outlen : Int32*) : LibC::Char*
  fun zlib_decode_noheader_buffer = stbi_zlib_decode_noheader_buffer(obuffer : LibC::Char*, olen : Int32, ibuffer : LibC::Char*, ilen : Int32) : Int32

  fun write_png = stbi_write_png(filename : LibC::Char*, w : Int32, h : Int32, comp : Int32, data : Pointer(Void), stride_in_bytes : Int32) : Int32
  fun write_bmp = stbi_write_bmp(filename : LibC::Char*, w : Int32, h : Int32, comp : Int32, data : Pointer(Void)) : Int32
  fun write_tga = stbi_write_tga(filename : LibC::Char*, w : Int32, h : Int32, comp : Int32, data : Pointer(Void)) : Int32
  fun write_hdr = stbi_write_hdr(filename : LibC::Char*, w : Int32, h : Int32, comp : Int32, data : Pointer(Void)) : Int32
end
