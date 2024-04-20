#version 450
#extension GL_EXT_nonuniform_qualifier: require

layout(set = 0, binding = 2) buffer BufferArray {
    uint value[];
} buffers[];
layout(location = 0) out vec2 tex_coords;

uint readUint(uint buffer_id, uint word_index) {
    return buffers[buffer_id].value[word_index];
}

float readFloat(uint buffer_id, uint word_index) {
    return uintBitsToFloat(readUint(buffer_id, word_index));
}

void main() {
    uint buffer_id = 0;
    uint word_index = gl_VertexIndex * 2;
    vec2 position = vec2(readFloat(buffer_id, word_index), readFloat(buffer_id, word_index+1));
    gl_Position = vec4(position, 0.0, 1.0);
    tex_coords = position + vec2(0.5);
}
