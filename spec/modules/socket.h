/*

socket.h

Sockets API prototypes.

WARNING: THIS FILE IS PART OF THE OS SPEC, THIS SHOULD NOT BE USED AS AN ACTUAL OS HEADER

*/

enum ESocketProtocol
{
	PROTO_DGRAM,
	PROTO_TCP,
	PROTO_OTHER,
};

struct socket_t;

socket_t* socket_create();
