Ì
dC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Business\DBContext.cs
	namespace 	
FlixnetBackend
 
. 
Business !
{ 
public 

class 
	DBContext 
: 
	DbContext &
{		 
public

 
	DBContext

 
(

 
DbContextOptions

 )
options

* 1
)

1 2
:

3 4
base

5 9
(

9 :
options

: A
)

A B
{ 	
} 	
public 
virtual 
DbSet 
< 
User !
>! "
Users# (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
virtual 
DbSet 
< 
Movie "
>" #
Movies$ *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
virtual 
DbSet 
< 

MovieImage '
>' (
MovieImages) 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
DbSet 
< 

LikedMovie 
>  
LikedMovies! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
modelBuilder 
. 
Entity 
<  
User  $
>$ %
(% &
)& '
.' (
Property( 0
(0 1
Users1 6
=>7 9
Users: ?
.? @
ID@ B
)B C
.C D
HasDefaultValueSqlD V
(V W
$strW `
)` a
;a b
modelBuilder 
. 
Entity 
<  
Movie  %
>% &
(& '
)' (
.( )
Property) 1
(1 2
Movies2 8
=>9 ;
Movies< B
.B C
IDC E
)E F
.F G
HasDefaultValueSqlG Y
(Y Z
$strZ c
)c d
;d e
modelBuilder 
. 
Entity 
<  
Movie  %
>% &
(& '
)' (
.( )
Property) 1
(1 2
Movies2 8
=>9 ;
Movies< B
.B C
IDC E
)E F
.F G
HasDefaultValueSqlG Y
(Y Z
$strZ c
)c d
;d e
modelBuilder 
. 
Entity 
<  

MovieImage  *
>* +
(+ ,
), -
.- .
Property. 6
(6 7
MovieImages7 B
=>C E
MovieImagesF Q
.Q R
IDR T
)T U
.U V
HasDefaultValueSqlV h
(h i
$stri r
)r s
;s t
modelBuilder 
. 
Entity 
<  
User  $
>$ %
(% &
)& '
. 	
HasMany	 
( 
u 
=> 
u 
. 
LikedMovies #
)# $
. 	
WithOne	 
( 
lm 
=> 
lm 
. 
User 
) 
. 	
HasForeignKey	 
( 
lm 
=> 
lm 
.  
UserId  &
)& '
;' (
}   	
}!! 
}"" ®
eC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Business\LikedMovie.cs
	namespace 	
FlixnetBackend
 
. 
Business !
{ 
public 

class 

LikedMovie 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
Guid		 
UserId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
MovieId

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
DateTime 
LikedOn 
{  !
get" %
;% &
set' *
;* +
}, -
public 
User 
User 
{ 
get 
; 
set  #
;# $
}% &
} 
} ¡

`C:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Business\Movie.cs
	namespace 	
FlixnetBackend
 
. 
Business !
{ 
public 

class 
Movie 
{ 
[ 	
Key	 
] 
[ 
Required 
] 
public 
Guid #
ID$ &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[		 	
Required			 
]		 
public		 
string		  
Title		! &
{		' (
get		) ,
;		, -
set		. 1
;		1 2
}		3 4
public

 
string

 
Overview

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
GenreId 
{ 
get  
;  !
set" %
;% &
}' (
public 
Movie 
( 
) 
{ 	
} 	
} 
} Ï
eC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Business\MovieImage.cs
	namespace 	
FlixnetBackend
 
. 
Business !
{ 
public 

class 

MovieImage 
{ 
[ 	
Key	 
] 
[ 
Required 
] 
public 
Guid #
ID$ &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[		 	
Required			 
]		 
public		 
string		  
ImageUrl		! )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
public

 
Guid

 
MovieID

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
[ 	
Required	 
] 
public 
virtual !
Movie" '
Movie( -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 

MovieImage 
( 
string  
imageUrl! )
,) *
Guid+ /
movieID0 7
)7 8
{ 	
ImageUrl 
= 
imageUrl 
;  
MovieID 
= 
movieID 
; 
} 	
} 
} ¬

_C:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Business\User.cs
	namespace 	
FlixnetBackend
 
. 
Business !
{ 
public 

class 
User 
{ 
[ 	
Key	 
] 
[ 
Required 
] 
public 
Guid #
ID$ &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public		 
string		 
UserName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
ICollection 
< 

LikedMovie %
>% &
LikedMovies' 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
User 
( 
) 
{ 	
} 	
} 
} û
kC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Configuration\KeyProvider.cs
	namespace 	
FlixnetBackend
 
. 
Configuration &
{ 
public 

static 
class 
KeyProvider #
{ 
public 
static 
string 
GetSecretKey )
() *
)* +
{		 	
var

 
configuration

 
=

 
new

  # 
ConfigurationBuilder

$ 8
(

8 9
)

9 :
. 
SetBasePath 
( 
	Directory &
.& '
GetCurrentDirectory' :
(: ;
); <
)< =
. 
AddJsonFile 
( 
$str /
)/ 0
. 
Build 
( 
) 
; 
return 
configuration  
.  !

GetSection! +
(+ ,
$str, 5
)5 6
.6 7
Value7 <
;< =
} 	
} 
} Ó
mC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Controllers\MovieController.cs
	namespace 	
FlixnetBackend
 
. 
Controllers $
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
MovieController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
ILikedMovieService +
likedMovieService, =
;= >
public 
MovieController 
( 
IMapper &
mapper' -
,- .
ILikedMovieService/ A
likedMovieServiceB S
)S T
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 
likedMovieService "
=# $
likedMovieService% 6
;6 7
} 	
[++ 	
HttpPost++	 
(++ 
$str++ 
)++ 
]++ 
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
	LikeMovie,,) 2
(,,2 3
[,,3 4
FromBody,,4 <
],,< =
LikeMovieModel,,> L
likemoviemodel,,M [
),,[ \
{-- 	
if11 
(11 
likemoviemodel11 
==11 !
null11" &
||11' )
string11* 0
.110 1
IsNullOrWhiteSpace111 C
(11C D
likemoviemodel11D R
.11R S
UserId11S Y
)11Y Z
||11[ ]
string11^ d
.11d e
IsNullOrWhiteSpace11e w
(11w x
likemoviemodel	11x †
.
11† ‡
MovieId
11‡ Ž
)
11Ž 
)
11 
{22 
return33 

BadRequest33 !
(33! "
$str33" E
)33E F
;33F G
}44 
if99 
(99 
!99 
Guid99 
.99 
TryParse99 
(99 
likemoviemodel99 -
.99- .
UserId99. 4
,994 5
out996 9
var99: =
userId99> D
)99D E
)99E F
{:: 
return;; 

BadRequest;; !
(;;! "
$str;;" 4
);;4 5
;;;5 6
}<< 
await?? 
likedMovieService?? #
.??# $
	LikeMovie??$ -
(??- .
userId??. 4
,??4 5
likemoviemodel??6 D
.??D E
MovieId??E L
)??L M
;??M N
returnBB 
OkBB 
(BB 
)BB 
;BB 
}CC 	
[EE 	
HttpGetEE	 
(EE 
$strEE  
)EE  !
]EE! "
publicFF 
asyncFF 
TaskFF 
<FF 
IActionResultFF '
>FF' (
GetLikedMoviesFF) 7
(FF7 8
GuidFF8 <
userIdFF= C
)FFC D
{GG 	
varHH 
likedMoviesHH 
=HH 
awaitHH #
likedMovieServiceHH$ 5
.HH5 6 
GetLikedMoviesByUserHH6 J
(HHJ K
userIdHHK Q
)HHQ R
;HHR S
ifII 
(II 
likedMoviesII 
==II 
nullII #
)II# $
returnII% +
NotFoundII, 4
(II4 5
)II5 6
;II6 7
returnJJ 
OkJJ 
(JJ 
likedMoviesJJ !
)JJ! "
;JJ" #
}KK 	
}NN 
}OO è&
lC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Controllers\UserController.cs
	namespace 	
FlixnetBackend
 
. 
Controllers $
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
UserController 
:  !

Controller" ,
{ 
private 
readonly 
IUserService %
userService& 1
;1 2
private 
readonly 
IMapper  
mapper! '
;' (
public 
UserController 
( 
IUserService *
userService+ 6
,6 7
IMapper8 ?
mapper@ F
)F G
{ 	
this 
. 
userService 
= 
userService *
;* +
this 
. 
mapper 
= 
mapper  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
string' -
>- .
>. /
GetUserName0 ;
(; <
Guid< @
userIdA G
)G H
{ 	
var   
userName   
=   
await    
userService  ! ,
.  , -
GetUserNameById  - <
(  < =
userId  = C
)  C D
;  D E
if!! 
(!! 
string!! 
.!! 
IsNullOrEmpty!! $
(!!$ %
userName!!% -
)!!- .
)!!. /
{"" 
return## 
NotFound## 
(##  
$str##  1
)##1 2
;##2 3
}$$ 
return%% 
Ok%% 
(%% 
userName%% 
)%% 
;%%  
}&& 	
[(( 	
HttpGet((	 
](( 
[)) 	
Route))	 
()) 
$str)) 
))) 
])) 
public** 
IActionResult** 
GetUserByEmail** +
(**+ ,
string**, 2
email**3 8
)**8 9
{++ 	
return,, 
Ok,, 
(,, 
userService,, !
.,,! "
GetUserByEmail,," 0
(,,0 1
email,,1 6
),,6 7
),,7 8
;,,8 9
}-- 	
[// 	
HttpPost//	 
]// 
public00 
IActionResult00 

CreateUser00 '
(00' (
CreateUserModel00( 7
model008 =
)00= >
{11 	
if22 
(22 
!22 

ModelState22 
.22 
IsValid22 #
)22# $
{33 
return44 

BadRequest44 !
(44! "

ModelState44" ,
)44, -
;44- .
}55 
	UserModel77 
result77 
=77 
userService77 *
.77* +

CreateUser77+ 5
(775 6
model776 ;
)77; <
;77< =
return99 
Ok99 
(99 
result99 
)99 
;99 
}:: 	
[<< 	
HttpPost<<	 
(<< 
$str<< 
)<< 
]<< 
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
Login==) .
(==. /
[==/ 0
FromBody==0 8
]==8 9

LoginModel==: D
model==E J
)==J K
{>> 	
if@@ 
(@@ 
!@@ 

ModelState@@ 
.@@ 
IsValid@@ #
)@@# $
{AA 
returnBB 

BadRequestBB !
(BB! "
$strBB" 0
)BB0 1
;BB1 2
}DD 
varEE 
userEE 
=EE 
userServiceEE "
.EE" #
GetUserByEmailEE# 1
(EE1 2
modelEE2 7
.EE7 8
EmailEE8 =
)EE= >
;EE> ?
ifGG 
(GG 
userGG 
==GG 
nullGG 
||GG 
!GG  !
userServiceGG! ,
.GG, -
ValidateUserGG- 9
(GG9 :
modelGG: ?
)GG? @
)GG@ A
{HH 
returnII 
UnauthorizedII #
(II# $
$strII$ 9
)II9 :
;II: ;
}JJ 
returnOO 
OkOO 
(OO 
newOO 
{OO 
MessageOO #
=OO$ %
$strOO& 7
,OO7 8
IDOO9 ;
=OO< =
userOO> B
.OOB C
IDOOC E
}OOF G
)OOG H
;OOH I
}PP 	
}jj 
}kk Ì
rC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Interfaces\ILikedMovieRepository.cs
	namespace 	
FlixnetBackend
 
. 

Interfaces #
{ 
public 

	interface !
ILikedMovieRepository *
{ 
Task 
< 
IEnumerable 
< 

LikedMovie #
># $
>$ % 
GetLikedMoviesByUser& :
(: ;
Guid; ?
userId@ F
)F G
;G H
Task 
	LikeMovie 
( 

LikedMovie !

likedMovie" ,
), -
;- .
}		 
}

 ô
oC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Interfaces\ILikedMovieService.cs
	namespace 	
FlixnetBackend
 
. 

Interfaces #
{ 
public 

	interface 
ILikedMovieService '
{ 
Task 
	LikeMovie 
( 
Guid 
userId "
," #
string$ *
movieId+ 2
)2 3
;3 4
Task 
< 
IEnumerable 
< 

LikedMovie #
># $
>$ % 
GetLikedMoviesByUser& :
(: ;
Guid; ?
userId@ F
)F G
;G H
}		 
}

 È
mC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Interfaces\IMovieRepository.cs
	namespace 	
FlixnetBackend
 
. 

Interfaces #
{ 
public		 

	interface		 
IMovieRepository		 %
{

 
} 
} Â
jC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Interfaces\IMovieService.cs
	namespace 	
FlixnetBackend
 
. 

Interfaces #
{ 
public 

	interface 
IMovieService "
{ 
} 
} ÷
lC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Interfaces\IUserRepository.cs
	namespace 	
FlixnetBackend
 
. 

Interfaces #
{ 
public 

	interface 
IUserRepository $
{ 
User 
GetUser 
( 
Guid 
userID  
)  !
;! "
User 
GetUserByEmail 
( 
string "
email# (
)( )
;) *
Task		 
<		 
string		 
>		 
GetUserNameById		 $
(		$ %
Guid		% )
userId		* 0
)		0 1
;		1 2
User

 

CreateUser

 
(

 
User

 

userEntity

 '
)

' (
;

( )
} 
} …
iC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Interfaces\IUserService.cs
	namespace 	
FlixnetBackend
 
. 

Interfaces #
{ 
public 

	interface 
IUserService !
{ 
Task 
< 
string 
> 
GetUserNameById $
($ %
Guid% )
userId* 0
)0 1
;1 2
User		 
GetUserByEmail		 
(		 
string		 "
email		# (
)		( )
;		) *
	UserModel

 

CreateUser

 
(

 
CreateUserModel

 ,
user

- 1
)

1 2
;

2 3
bool 
ValidateUser 
( 

LoginModel $
model% *
)* +
;+ ,
} 
} â
iC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Logic\LikedMovieService.cs
	namespace 	
FlixnetBackend
 
. 
Logic 
{ 
public 

class 
LikedMovieService "
:# $
ILikedMovieService% 7
{		 
private

 
readonly

 !
ILikedMovieRepository

 .
_repository

/ :
;

: ;
private 
readonly 
IHubContext $
<$ %
NotificationHub% 4
>4 5
_hubContext6 A
;A B
private 
readonly 
IUserService %
_userService& 2
;2 3
public 
LikedMovieService  
(  !!
ILikedMovieRepository! 6

repository7 A
,A B
IHubContextC N
<N O
NotificationHubO ^
>^ _

hubContext` j
,j k
IUserService 
userService $
)$ %
{ 	
_repository 
= 

repository $
;$ %
_hubContext 
= 

hubContext $
;$ %
_userService 
= 
userService &
;& '
} 	
public 
async 
Task 
	LikeMovie #
(# $
Guid$ (
userId) /
,/ 0
string1 7
movieId8 ?
)? @
{ 	
var 

likedMovie 
= 
new  

LikedMovie! +
{ 
UserId 
= 
userId 
,  
MovieId 
= 
movieId !
,! "
LikedOn 
= 
DateTime "
." #
UtcNow# )
} 
; 
await 
_repository 
. 
	LikeMovie '
(' (

likedMovie( 2
)2 3
;3 4
var   
userName   
=   
await    
_userService  ! -
.  - .
GetUserNameById  . =
(  = >
userId  > D
)  D E
;  E F
await%% 
_hubContext%% 
.%% 
Clients%% %
.%%% &
All%%& )
.%%) *
	SendAsync%%* 3
(%%3 4
$str%%4 M
,%%M N
new%%O R
{%%S T
userId%%T Z
,%%Z [
movieId%%\ c
,%%c d
userName%%e m
}%%m n
)%%n o
;%%o p
}&& 	
public(( 
async(( 
Task(( 
<(( 
IEnumerable(( %
<((% &

LikedMovie((& 0
>((0 1
>((1 2 
GetLikedMoviesByUser((3 G
(((G H
Guid((H L
userId((M S
)((S T
{)) 	
return** 
await** 
_repository** $
.**$ % 
GetLikedMoviesByUser**% 9
(**9 :
userId**: @
)**@ A
;**A B
}++ 	
},, 
}-- ñ
dC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Logic\MovieService.cs
	namespace 	
FlixnetBackend
 
. 
Logic 
{		 
public

 

class

 
MovieService

 
:

 
IMovieService

  -
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IMovieRepository )
movieRepository* 9
;9 :
public 
MovieService 
( 
IMapper #
mapper$ *
,* +
IMovieRepository, <
movieRepository= L
)L M
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 
movieRepository  
=! "
movieRepository# 2
;2 3
} 	
} 
} Þ
gC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Logic\NotificationHub.cs
	namespace 	
FlixnetBackend
 
. 
Logic 
{ 
public 

class 
NotificationHub  
:! "
Hub# &
{ 
public 
async 
Task 
	LikeMovie #
(# $
int$ '
movieId( /
)/ 0
{		 	
await 
Clients 
. 
Others  
.  !
	SendAsync! *
(* +
$str+ D
,D E
movieIdF M
)M N
;N O
} 	
} 
} ¾
mC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Logic\TMDBBackgroundService.cs
	namespace 	
FlixnetBackend
 
. 
Logic 
{		 
public

 

class

 !
TMDBBackgroundService

 &
{ 
private 
readonly 
IHttpClientFactory +
_httpClientFactory, >
;> ?
} 
} ¹$
cC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Logic\UserService.cs
	namespace

 	
FlixnetBackend


 
.

 
Logic

 
{ 
public 

class 
UserService 
: 
IUserService +
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IUserRepository (
userRepository) 7
;7 8
private 
readonly 
IPasswordHasher (
<( )
User) -
>- .
passwordHasher/ =
;= >
public 
UserService 
( 
IMapper "
mapper# )
,) *
IUserRepository+ :
userRepository; I
,I J
IPasswordHasherK Z
<Z [
User[ _
>_ `
passwordHashera o
)o p
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 
userRepository 
=  !
userRepository" 0
;0 1
this 
. 
passwordHasher 
=  !
passwordHasher" 0
;0 1
} 	
public 
async 
Task 
< 
string  
>  !
GetUserNameById" 1
(1 2
Guid2 6
userId7 =
)= >
{ 	
return 
await 
userRepository '
.' (
GetUserNameById( 7
(7 8
userId8 >
)> ?
;? @
} 	
public 
User 
GetUser 
( 
Guid  
userID! '
)' (
{   	
return!! 
this!! 
.!! 
userRepository!! &
.!!& '
GetUser!!' .
(!!. /
userID!!/ 5
)!!5 6
;!!6 7
}"" 	
public$$ 
User$$ 
GetUserByEmail$$ "
($$" #
string$$# )
email$$* /
)$$/ 0
{%% 	
return&& 
userRepository&& !
.&&! "
GetUserByEmail&&" 0
(&&0 1
email&&1 6
)&&6 7
;&&7 8
})) 	
public++ 
	UserModel++ 

CreateUser++ #
(++# $
CreateUserModel++$ 3

insertUser++4 >
)++> ?
{,, 	
User-- 
user-- 
=-- 
new-- 
User--  
{.. 
UserName// 
=// 

insertUser// %
.//% &
UserName//& .
,//. /
Email00 
=00 

insertUser00 "
.00" #
Email00# (
,00( )
Password11 
=11 
passwordHasher11 )
.11) *
HashPassword11* 6
(116 7
null117 ;
,11; <

insertUser11= G
.11G H
Password11H P
)11P Q
}22 
;22 
User33 
returnedUser33 
=33 
userRepository33  .
.33. /

CreateUser33/ 9
(339 :
user33: >
)33> ?
;33? @
return55 
mapper55 
.55 
Map55 
<55 
	UserModel55 '
>55' (
(55( )
returnedUser55) 5
)555 6
;556 7
}77 	
public99 
bool99 
ValidateUser99  
(99  !

LoginModel99! +
model99, 1
)991 2
{:: 	
User;; 
user;; 
=;; 
userRepository;; &
.;;& '
GetUserByEmail;;' 5
(;;5 6
model;;6 ;
.;;; <
Email;;< A
);;A B
;;;B C
if<< 
(<< 
user<< 
!=<< 
null<< 
)<< 
{== 
var>> 
result>> 
=>> 
passwordHasher>> +
.>>+ , 
VerifyHashedPassword>>, @
(>>@ A
user>>A E
,>>E F
user>>G K
.>>K L
Password>>L T
,>>T U
model>>V [
.>>[ \
Password>>\ d
)>>d e
;>>e f
return?? 
result?? 
==??  &
PasswordVerificationResult??! ;
.??; <
Success??< C
;??C D
}@@ 
returnAA 
falseAA 
;AA 
}BB 	
}HH 
}II ­

aC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\MappingProfiles.cs
	namespace 	
FlixnetBackend
 
{ 
public 

class 
MappingProfiles  
:! "
Profile# *
{ 
public 
MappingProfiles 
( 
)  
{		 	
	CreateMap

 
<

 
Business

 
.

 
Movie

 $
,

$ %
Models

& ,
.

, -

MovieModel

- 7
>

7 8
(

8 9
)

9 :
;

: ;
	CreateMap 
< 
Models 
. 

MovieModel '
,' (
Business) 1
.1 2
Movie2 7
>7 8
(8 9
)9 :
;: ;
	CreateMap 
< 
Business 
. 
User #
,# $
Models% +
.+ ,
	UserModel, 5
>5 6
(6 7
)7 8
;8 9
	CreateMap 
< 
Models 
. 
	UserModel &
,& '
Business( 0
.0 1
User1 5
>5 6
(6 7
)7 8
;8 9
} 	
} 
} ÷S
yC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Migrations\20240104210658_InitialCreate.cs
	namespace 	
FlixnetBackend
 
. 

Migrations #
{ 
public		 

partial		 
class		 
InitialCreate		 &
:		' (
	Migration		) 2
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
ID 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 D
,D E
nullableF N
:N O
falseP U
,U V
defaultValueSqlW f
:f g
$strh q
)q r
,r s
Title 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 F
,F G
nullableH P
:P Q
falseR W
)W X
,X Y
Overview 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
nullableK S
:S T
falseU Z
)Z [
,[ \
ImageUrl 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
nullableK S
:S T
falseU Z
)Z [
,[ \
GenreId 
= 
table #
.# $
Column$ *
<* +
int+ .
>. /
(/ 0
type0 4
:4 5
$str6 ;
,; <
nullable= E
:E F
falseG L
)L M
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 0
,0 1
x2 3
=>4 6
x7 8
.8 9
ID9 ;
); <
;< =
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{   
ID!! 
=!! 
table!! 
.!! 
Column!! %
<!!% &
Guid!!& *
>!!* +
(!!+ ,
type!!, 0
:!!0 1
$str!!2 D
,!!D E
nullable!!F N
:!!N O
false!!P U
,!!U V
defaultValueSql!!W f
:!!f g
$str!!h q
)!!q r
,!!r s
UserName"" 
="" 
table"" $
.""$ %
Column""% +
<""+ ,
string"", 2
>""2 3
(""3 4
type""4 8
:""8 9
$str"": I
,""I J
nullable""K S
:""S T
false""U Z
)""Z [
,""[ \
Email## 
=## 
table## !
.##! "
Column##" (
<##( )
string##) /
>##/ 0
(##0 1
type##1 5
:##5 6
$str##7 F
,##F G
nullable##H P
:##P Q
false##R W
)##W X
,##X Y
Password$$ 
=$$ 
table$$ $
.$$$ %
Column$$% +
<$$+ ,
string$$, 2
>$$2 3
($$3 4
type$$4 8
:$$8 9
$str$$: I
,$$I J
nullable$$K S
:$$S T
false$$U Z
)$$Z [
}%% 
,%% 
constraints&& 
:&& 
table&& "
=>&&# %
{'' 
table(( 
.(( 

PrimaryKey(( $
((($ %
$str((% /
,((/ 0
x((1 2
=>((3 5
x((6 7
.((7 8
ID((8 :
)((: ;
;((; <
})) 
))) 
;)) 
migrationBuilder++ 
.++ 
CreateTable++ (
(++( )
name,, 
:,, 
$str,, #
,,,# $
columns-- 
:-- 
table-- 
=>-- !
new--" %
{.. 
ID// 
=// 
table// 
.// 
Column// %
<//% &
Guid//& *
>//* +
(//+ ,
type//, 0
://0 1
$str//2 D
,//D E
nullable//F N
://N O
false//P U
,//U V
defaultValueSql//W f
://f g
$str//h q
)//q r
,//r s
ImageUrl00 
=00 
table00 $
.00$ %
Column00% +
<00+ ,
string00, 2
>002 3
(003 4
type004 8
:008 9
$str00: I
,00I J
nullable00K S
:00S T
false00U Z
)00Z [
,00[ \
MovieID11 
=11 
table11 #
.11# $
Column11$ *
<11* +
Guid11+ /
>11/ 0
(110 1
type111 5
:115 6
$str117 I
,11I J
nullable11K S
:11S T
false11U Z
)11Z [
}22 
,22 
constraints33 
:33 
table33 "
=>33# %
{44 
table55 
.55 

PrimaryKey55 $
(55$ %
$str55% 5
,555 6
x557 8
=>559 ;
x55< =
.55= >
ID55> @
)55@ A
;55A B
table66 
.66 

ForeignKey66 $
(66$ %
name77 
:77 
$str77 =
,77= >
column88 
:88 
x88  !
=>88" $
x88% &
.88& '
MovieID88' .
,88. /
principalTable99 &
:99& '
$str99( 0
,990 1
principalColumn:: '
:::' (
$str::) -
,::- .
onDelete;;  
:;;  !
ReferentialAction;;" 3
.;;3 4
Cascade;;4 ;
);;; <
;;;< =
}<< 
)<< 
;<< 
migrationBuilder>> 
.>> 
CreateTable>> (
(>>( )
name?? 
:?? 
$str?? #
,??# $
columns@@ 
:@@ 
table@@ 
=>@@ !
new@@" %
{AA 
IdBB 
=BB 
tableBB 
.BB 
ColumnBB %
<BB% &
GuidBB& *
>BB* +
(BB+ ,
typeBB, 0
:BB0 1
$strBB2 D
,BBD E
nullableBBF N
:BBN O
falseBBP U
)BBU V
,BBV W
UserIdCC 
=CC 
tableCC "
.CC" #
ColumnCC# )
<CC) *
GuidCC* .
>CC. /
(CC/ 0
typeCC0 4
:CC4 5
$strCC6 H
,CCH I
nullableCCJ R
:CCR S
falseCCT Y
)CCY Z
,CCZ [
MovieIdDD 
=DD 
tableDD #
.DD# $
ColumnDD$ *
<DD* +
stringDD+ 1
>DD1 2
(DD2 3
typeDD3 7
:DD7 8
$strDD9 H
,DDH I
nullableDDJ R
:DDR S
falseDDT Y
)DDY Z
,DDZ [
LikedOnEE 
=EE 
tableEE #
.EE# $
ColumnEE$ *
<EE* +
DateTimeEE+ 3
>EE3 4
(EE4 5
typeEE5 9
:EE9 :
$strEE; F
,EEF G
nullableEEH P
:EEP Q
falseEER W
)EEW X
}FF 
,FF 
constraintsGG 
:GG 
tableGG "
=>GG# %
{HH 
tableII 
.II 

PrimaryKeyII $
(II$ %
$strII% 5
,II5 6
xII7 8
=>II9 ;
xII< =
.II= >
IdII> @
)II@ A
;IIA B
tableJJ 
.JJ 

ForeignKeyJJ $
(JJ$ %
nameKK 
:KK 
$strKK ;
,KK; <
columnLL 
:LL 
xLL  !
=>LL" $
xLL% &
.LL& '
UserIdLL' -
,LL- .
principalTableMM &
:MM& '
$strMM( /
,MM/ 0
principalColumnNN '
:NN' (
$strNN) -
,NN- .
onDeleteOO  
:OO  !
ReferentialActionOO" 3
.OO3 4
CascadeOO4 ;
)OO; <
;OO< =
}PP 
)PP 
;PP 
migrationBuilderRR 
.RR 
CreateIndexRR (
(RR( )
nameSS 
:SS 
$strSS -
,SS- .
tableTT 
:TT 
$strTT $
,TT$ %
columnUU 
:UU 
$strUU  
)UU  !
;UU! "
migrationBuilderWW 
.WW 
CreateIndexWW (
(WW( )
nameXX 
:XX 
$strXX .
,XX. /
tableYY 
:YY 
$strYY $
,YY$ %
columnZZ 
:ZZ 
$strZZ !
)ZZ! "
;ZZ" #
}[[ 	
	protected^^ 
override^^ 
void^^ 
Down^^  $
(^^$ %
MigrationBuilder^^% 5
migrationBuilder^^6 F
)^^F G
{__ 	
migrationBuilder`` 
.`` 
	DropTable`` &
(``& '
nameaa 
:aa 
$straa #
)aa# $
;aa$ %
migrationBuildercc 
.cc 
	DropTablecc &
(cc& '
namedd 
:dd 
$strdd #
)dd# $
;dd$ %
migrationBuilderff 
.ff 
	DropTableff &
(ff& '
namegg 
:gg 
$strgg 
)gg 
;gg 
migrationBuilderii 
.ii 
	DropTableii &
(ii& '
namejj 
:jj 
$strjj 
)jj 
;jj  
}kk 	
}ll 
}mm ¼
hC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Models\CreateUserModel.cs
	namespace 	
FlixnetBackend
 
. 
Models 
{ 
public 

class 
CreateUserModel  
{ 
[ 	
Key	 
] 
[ 
Required 
] 
public 
Guid #
ID$ &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
Password

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
CreateUserModel 
( 
Guid #
id$ &
,& '
string( .
username/ 7
,7 8
string9 ?
email@ E
,E F
stringG M
passwordN V
)V W
{ 	
ID 
= 
id 
; 
UserName 
= 
username 
;  
Email 
= 
email 
; 
Password 
= 
password 
;  
} 	
public 
CreateUserModel 
( 
)  
{ 	
} 	
} 
} í
gC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Models\LikeMovieModel.cs
	namespace 	
FlixnetBackend
 
. 
Models 
{ 
public 

class 
LikeMovieModel 
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
MovieId 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ‰
cC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Models\LoginModel.cs
	namespace 	
FlixnetBackend
 
. 
Models 
{ 
public 

class 

LoginModel 
{ 
[ 	
Key	 
] 
[ 
Required 
] 
public 
Guid #
ID$ &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
Password		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public 

LoginModel 
( 
Guid 
id !
,! "
string# )
email* /
,/ 0
string1 7
password8 @
)@ A
{ 	
ID 
= 
id 
; 
Email 
= 
email 
; 
Password 
= 
password 
;  
} 	
public 

LoginModel 
( 
) 
{ 	
} 	
} 
} Š
cC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Models\MovieModel.cs
	namespace 	
FlixnetBackend
 
. 
Models 
{ 
public 

class 

MovieModel 
{ 
public 
Guid 
ID 
{ 
get 
; 
set !
;! "
}# $
public		 
string		 
Title		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
Overview

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
GenreId 
{ 
get  
;  !
set" %
;% &
}' (
public 

MovieModel 
( 
Guid 
id !
,! "
string# )
title* /
,/ 0
string1 7
description8 C
,C D
stringE K
imagesL R
,R S
intT W
genreIdX _
)_ `
{ 	
ID 
= 
id 
; 
Title 
= 
title 
; 
Overview 
= 
description "
;" #
ImageUrl 
= 
images 
; 
GenreId 
= 
genreId 
; 
} 	
public 

MovieModel 
( 
Movie 
movie  %
)% &
{ 	
ID 
= 
movie 
. 
ID 
; 
Title 
= 
movie 
. 
Title 
;  
Overview 
= 
movie 
. 
Overview %
;% &
ImageUrl 
= 
movie 
. 
ImageUrl %
;% &
GenreId 
= 
movie 
. 
GenreId #
;# $
} 	
} 
}   
bC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Models\UserModel.cs
	namespace 	
FlixnetBackend
 
. 
Models 
{ 
public 

class 
	UserModel 
{ 
[ 	
Key	 
] 
[ 
Required 
] 
public 
Guid #
ID$ &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public		 
string		 
UserName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
	UserModel 
( 
Guid 
id  
,  !
string" (
username) 1
,1 2
string3 9
email: ?
,? @
stringA G
passwordH P
)P Q
{ 	
ID 
= 
id 
; 
UserName 
= 
username 
;  
Email 
= 
email 
; 
Password 
= 
password 
;  
} 	
public 
	UserModel 
( 
User 
user "
)" #
{ 	
ID 
= 
user 
. 
ID 
; 
UserName 
= 
user 
. 
UserName $
;$ %
Email 
= 
user 
. 
Email 
; 
Password 
= 
user 
. 
Password $
;$ %
} 	
public 
	UserModel 
( 
Guid 
id  
,  !
string" (
email) .
,. /
string0 6
password7 ?
)? @
{ 	
ID   
=   
id   
;   
Email!! 
=!! 
email!! 
;!! 
Password"" 
="" 
password"" 
;""  
}## 	
public%% 
	UserModel%% 
(%% 
)%% 
{&& 	
}(( 	
})) 
}** €
dC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Pages\Error.cshtml.cs
	namespace 	
FlixnetBackend
 
. 
Pages 
{ 
[ 
ResponseCache 
( 
Duration 
= 
$num 
,  
Location! )
=* +!
ResponseCacheLocation, A
.A B
NoneB F
,F G
NoStoreH O
=P Q
trueR V
)V W
]W X
[ "
IgnoreAntiforgeryToken 
] 
public		 

class		 

ErrorModel		 
:		 
	PageModel		 '
{

 
public 
string 
? 
	RequestId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
ShowRequestId !
=>" $
!% &
string& ,
., -
IsNullOrEmpty- :
(: ;
	RequestId; D
)D E
;E F
private 
readonly 
ILogger  
<  !

ErrorModel! +
>+ ,
_logger- 4
;4 5
public 

ErrorModel 
( 
ILogger !
<! "

ErrorModel" ,
>, -
logger. 4
)4 5
{ 	
_logger 
= 
logger 
; 
} 	
public 
void 
OnGet 
( 
) 
{ 	
	RequestId 
= 
Activity  
.  !
Current! (
?( )
.) *
Id* ,
??- /
HttpContext0 ;
.; <
TraceIdentifier< K
;K L
} 	
} 
} ó
dC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Pages\Index.cshtml.cs
	namespace 	
FlixnetBackend
 
. 
Pages 
{ 
public 

class 

IndexModel 
: 
	PageModel '
{ 
private 
readonly 
ILogger  
<  !

IndexModel! +
>+ ,
_logger- 4
;4 5
public

 

IndexModel

 
(

 
ILogger

 !
<

! "

IndexModel

" ,
>

, -
logger

. 4
)

4 5
{ 	
_logger 
= 
logger 
; 
} 	
public 
void 
OnGet 
( 
) 
{ 	
} 	
} 
} ý
fC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Pages\Privacy.cshtml.cs
	namespace 	
FlixnetBackend
 
. 
Pages 
{ 
public 

class 
PrivacyModel 
: 
	PageModel  )
{ 
private 
readonly 
ILogger  
<  !
PrivacyModel! -
>- .
_logger/ 6
;6 7
public

 
PrivacyModel

 
(

 
ILogger

 #
<

# $
PrivacyModel

$ 0
>

0 1
logger

2 8
)

8 9
{ 	
_logger 
= 
logger 
; 
} 	
public 
void 
OnGet 
( 
) 
{ 	
} 	
} 
} —?
YC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Program.cs
	namespace 	
FlixnetBackend
 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
var 
builder 
= 
WebApplication (
.( )
CreateBuilder) 6
(6 7
args7 ;
); <
;< =
builder   
.   
Services   
.   
AddControllers   +
(  + ,
)  , -
;  - .
builder!! 
.!! 
Services!! 
.!! #
AddEndpointsApiExplorer!! 4
(!!4 5
)!!5 6
;!!6 7
builder"" 
."" 
Services"" 
."" 
AddSwaggerGen"" *
(""* +
)""+ ,
;"", -
builder## 
.## 
Services## 
.## 

AddSignalR## '
(##' (
)##( )
;##) *
builder$$ 
.$$ 
Services$$ 
.$$ 
AddAuthentication$$ .
($$. /
JwtBearerDefaults$$/ @
.$$@ A 
AuthenticationScheme$$A U
)$$U V
.%% 
AddJwtBearer%% 
(%% 
options%% $
=>%%% '
{&& 
options'' 
.'' %
TokenValidationParameters'' 4
=''5 6
new''7 :%
TokenValidationParameters''; T
{(( 
ValidateIssuer)) %
=))& '
true))( ,
,)), -
ValidateAudience** '
=**( )
true*** .
,**. /
ValidateLifetime++ '
=++( )
true++* .
,++. /$
ValidateIssuerSigningKey,, /
=,,0 1
true,,2 6
,,,6 7
ValidIssuer-- "
=--# $
$str--% <
,--< =
ValidAudience.. $
=..% &
$str..' >
,..> ?
IssuerSigningKey// '
=//( )
new//* - 
SymmetricSecurityKey//. B
(//B C
Encoding//C K
.//K L
UTF8//L P
.//P Q
GetBytes//Q Y
(//Y Z
$str	//Z …
)
//… †
)
//† ‡
}00 
;00 
}11 
)11 
;11 
builder22 
.22 
Services22 
.22 
AddCors22 $
(22$ %
options22% ,
=>22- /
{33 
options44 
.44 
AddDefaultPolicy44 (
(44( )
builder44) 0
=>441 3
{55 
builder66 
.77 
WithOrigins77 $
(77$ %
$str77% <
,77< =
$str77> U
)77U V
.88 
AllowAnyMethod88 '
(88' (
)88( )
.99 
AllowAnyHeader99 '
(99' (
)99( )
.:: 
AllowCredentials:: %
(::% &
)::& '
;::' (
};; 
);; 
;;; 
}<< 
)<< 
;<< 
builder?? 
.?? 
Services?? 
.?? 
AddAutoMapper?? *
(??* +
	AppDomain??+ 4
.??4 5
CurrentDomain??5 B
.??B C
GetAssemblies??C P
(??P Q
)??Q R
)??R S
;??S T
builderBB 
.BB 
ServicesBB 
.BB 
AddDbContextBB )
<BB) *
	DBContextBB* 3
>BB3 4
(BB4 5
optionsBB5 <
=>BB= ?
{CC 
optionsDD 
.DD 
UseSqlServerDD $
(DD$ %
builderDD% ,
.DD, -
ConfigurationDD- :
.DD: ;
GetConnectionStringDD; N
(DDN O
$strDDO X
)DDX Y
)DDY Z
;DDZ [
}EE 
)EE 
;EE 
RegisterInterfacesGG 
(GG 
builderGG &
)GG& '
;GG' (
varHH 
appHH 
=HH 
builderHH 
.HH 
BuildHH #
(HH# $
)HH$ %
;HH% &
ifKK 
(KK 
!KK 
appKK 
.KK 
EnvironmentKK  
.KK  !
IsDevelopmentKK! .
(KK. /
)KK/ 0
)KK0 1
{LL 
appMM 
.MM 

UseSwaggerMM 
(MM 
)MM  
;MM  !
appNN 
.NN 
UseSwaggerUINN  
(NN  !
)NN! "
;NN" #
}OO 
appQQ 
.QQ 
UseHttpsRedirectionQQ #
(QQ# $
)QQ$ %
;QQ% &
app`` 
.`` 

UseRouting`` 
(`` 
)`` 
;`` 
appaa 
.aa 
UseCorsaa 
(aa 
)aa 
;aa 
appbb 
.bb 
UseAuthenticationbb !
(bb! "
)bb" #
;bb# $
appdd 
.dd 
UseAuthorizationdd  
(dd  !
)dd! "
;dd" #
apphh 
.hh 
UseEndpointshh 
(hh 
	endpointshh &
=>hh' )
{ii 
	endpointsjj 
.jj 
MapControllersjj (
(jj( )
)jj) *
;jj* +
	endpointskk 
.kk 
MapHubkk  
<kk  !
NotificationHubkk! 0
>kk0 1
(kk1 2
$strkk2 D
)kkD E
;kkE F
}mm 
)mm 
;mm 
appoo 
.oo 
Runoo 
(oo 
)oo 
;oo 
}pp 	
private
¢¢ 
static
¢¢ 
void
¢¢  
RegisterInterfaces
¢¢ .
(
¢¢. /#
WebApplicationBuilder
¢¢/ D
builder
¢¢E L
)
¢¢L M
{
££ 	
builder
¤¤ 
.
¤¤ 
Services
¤¤ 
.
¤¤ 
	AddScoped
¤¤ &
<
¤¤& '
IMovieService
¤¤' 4
,
¤¤4 5
MovieService
¤¤6 B
>
¤¤B C
(
¤¤C D
)
¤¤D E
;
¤¤E F
builder
¥¥ 
.
¥¥ 
Services
¥¥ 
.
¥¥ 
	AddScoped
¥¥ &
<
¥¥& '
IMovieRepository
¥¥' 7
,
¥¥7 8
MovieRepository
¥¥9 H
>
¥¥H I
(
¥¥I J
)
¥¥J K
;
¥¥K L
builder
¦¦ 
.
¦¦ 
Services
¦¦ 
.
¦¦ 
	AddScoped
¦¦ &
<
¦¦& '
IUserService
¦¦' 3
,
¦¦3 4
UserService
¦¦5 @
>
¦¦@ A
(
¦¦A B
)
¦¦B C
;
¦¦C D
builder
§§ 
.
§§ 
Services
§§ 
.
§§ 
	AddScoped
§§ &
<
§§& '
IUserRepository
§§' 6
,
§§6 7
UserRepository
§§8 F
>
§§F G
(
§§G H
)
§§H I
;
§§I J
builder
¨¨ 
.
¨¨ 
Services
¨¨ 
.
¨¨ 
	AddScoped
¨¨ &
<
¨¨& '
IPasswordHasher
¨¨' 6
<
¨¨6 7
User
¨¨7 ;
>
¨¨; <
,
¨¨< =
PasswordHasher
¨¨> L
<
¨¨L M
User
¨¨M Q
>
¨¨Q R
>
¨¨R S
(
¨¨S T
)
¨¨T U
;
¨¨U V
builder
©© 
.
©© 
Services
©© 
.
©© 
	AddScoped
©© &
<
©©& ' 
ILikedMovieService
©©' 9
,
©©9 :
LikedMovieService
©©; L
>
©©L M
(
©©M N
)
©©N O
;
©©O P
builder
ªª 
.
ªª 
Services
ªª 
.
ªª 
	AddScoped
ªª &
<
ªª& '#
ILikedMovieRepository
ªª' <
,
ªª< ="
LikedMovieRepository
ªª> R
>
ªªR S
(
ªªS T
)
ªªT U
;
ªªU V
}
«« 	
}
­­ 
}®® Í
sC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Repositories\LikedMovieRepository.cs
	namespace 	
FlixnetBackend
 
. 
Repositories %
{ 
public 

class  
LikedMovieRepository %
:& '!
ILikedMovieRepository( =
{ 
private		 
readonly		 
	DBContext		 "
_context		# +
;		+ ,
public  
LikedMovieRepository #
(# $
	DBContext$ -
context. 5
)5 6
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &

LikedMovie& 0
>0 1
>1 2 
GetLikedMoviesByUser3 G
(G H
GuidH L
userIdM S
)S T
{ 	
return 
await 
_context !
.! "
LikedMovies" -
.- .
Where. 3
(3 4
lm4 6
=>7 9
lm: <
.< =
UserId= C
==D F
userIdG M
)M N
.N O
ToListAsyncO Z
(Z [
)[ \
;\ ]
} 	
public 
async 
Task 
	LikeMovie #
(# $

LikedMovie$ .

likedMovie/ 9
)9 :
{ 	
_context 
. 
LikedMovies  
.  !
Add! $
($ %

likedMovie% /
)/ 0
;0 1
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
} 	
} 
} ú
nC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Repositories\MovieRepository.cs
	namespace 	
FlixnetBackend
 
. 
Repositories %
{ 
public 

class 
MovieRepository  
:! "
	DbContext# ,
,, -
IMovieRepository. >
{		 
public

 
MovieRepository

 
(

 
DbContextOptions

 /
options

0 7
)

7 8
:

9 :
base

; ?
(

? @
options

@ G
)

G H
{ 	
Database 
. 
EnsureCreated "
(" #
)# $
;$ %
} 	
} 
} Á!
mC:\Users\Lizzy\OneDrive\Documenten\Semester 3.2\Backend-Flixnet\FlixnetBackend\Repositories\UserRepository.cs
	namespace 	
FlixnetBackend
 
. 
Repositories %
{ 
public 

class 
UserRepository 
:  !
	DBContext" +
,+ ,
IUserRepository- <
{		 
public

 
UserRepository

 
(

 
DbContextOptions

 .
options

/ 6
)

6 7
:

8 9
base

: >
(

> ?
options

? F
)

F G
{ 	
Database 
. 
EnsureCreated "
(" #
)# $
;$ %
} 	
public 
User 
GetUser 
( 
Guid  
userID! '
)' (
{ 	
User 
user 
= 
Users 
. 
Find "
(" #
userID# )
)) *
;* +
if 
( 
user 
== 
null 
) 
{ 
throw 
new 
	Exception #
(# $
$str$ 4
)4 5
;5 6
} 
return 
user 
; 
} 	
public 
async 
Task 
< 
string  
>  !
GetUserNameById" 1
(1 2
Guid2 6
userId7 =
)= >
{ 	
var 
user 
= 
await 
Users "
." #
	FindAsync# ,
(, -
userId- 3
)3 4
;4 5
return 
user 
? 
. 
UserName !
;! "
} 	
public 
User 
GetUserByEmail "
(" #
string# )
email* /
)/ 0
{   	
User!! 
user!! 
=!! 
null!! 
;!! 
try"" 
{## 
user$$ 
=$$ 
Users$$ 
.$$ 
FirstOrDefault$$ +
($$+ ,
x$$, -
=>$$. 0
x$$1 2
.$$2 3
Email$$3 8
==$$9 ;
email$$< A
)$$A B
;$$B C
if%% 
(%% 
user%% 
==%% 
null%%  
)%%  !
{&& 
Console'' 
.'' 
	WriteLine'' %
(''% &
$str''& ?
)''? @
;''@ A
}(( 
else)) 
{** 
Console++ 
.++ 
	WriteLine++ %
(++% &
$"++& (
$str++( <
{++< =
user++= A
.++A B
ID++B D
}++D E
"++E F
)++F G
;++G H
},, 
}-- 
catch.. 
(.. 
	Exception.. 
ex.. 
)..  
{// 
Console00 
.00 
	WriteLine00 !
(00! "
$"00" $
$str00$ ?
{00? @
ex00@ B
.00B C
Message00C J
}00J K
"00K L
)00L M
;00M N
}11 
return22 
user22 
;22 
}33 	
public44 
User44 

CreateUser44 
(44 
User44 #

userEntity44$ .
)44. /
{55 	
Users66 
.66 
Add66 
(66 

userEntity66  
)66  !
;66! "
Save77 
(77 
)77 
;77 
return88 

userEntity88 
;88 
}99 	
publicFF 
voidFF 
SaveFF 
(FF 
)FF 
{GG 	
SaveChangesHH 
(HH 
trueHH 
)HH 
;HH 
}II 	
publicKK 
voidKK 
SaveKK 
(KK 
boolKK "
acceptChangesOnSuccessKK 4
)KK4 5
{LL 	
SaveChangesMM 
(MM "
acceptChangesOnSuccessMM .
)MM. /
;MM/ 0
}NN 	
}OO 
}PP 