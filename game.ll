; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.posn = type { i32, i32 }
%struct.ms_board = type { i32, i32, i8*, i32, %struct.posn* }

@MAX_MINES = constant i32 99, align 4
@MAX_DIM = constant i32 16, align 4
@MIN_DIM = constant i32 4, align 4
@.str = private unnamed_addr constant [31 x i8] c"Welcome to ASCII minesweeper!\0A\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"width\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"height\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"mine count\00", align 1
@.str.4 = private unnamed_addr constant [68 x i8] c"You may select a game (1-9999) or pick 0 for a (pseudo)random game\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"game number\00", align 1
@.str.6 = private unnamed_addr constant [57 x i8] c"Press 'f' to place/remove a flag or 'r' to reveal a tile\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"Coordinate %c%d (%d,%d)\0A\00", align 1
@.str.8 = private unnamed_addr constant [47 x i8] c"Could not place/remove flag at that position!\0A\00", align 1
@.str.9 = private unnamed_addr constant [32 x i8] c"That tile is already revealed!\0A\00", align 1
@.str.10 = private unnamed_addr constant [29 x i8] c"Congratulations, you won!\0A%s\00", align 1
@face = internal constant [78 x i8] c"  _________\0A /         \5C\0A |  /\5C /\5C  |\0A |    -    |\0A |  \5C___/  |\0A \5C_________/\0A\00", align 16
@.str.11 = private unnamed_addr constant [24 x i8] c"Game over, you lose!\0A%s\00", align 1
@uded = internal constant [78 x i8] c"  _________\0A /         \5C\0A |  X   X  |\0A |    -    |\0A |  _____  |\0A \5C_________/\0A\00", align 16
@.str.12 = private unnamed_addr constant [18 x i8] c"Play again? (y/n)\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"OK, goodbye then!\0A\00", align 1
@.str.34 = private unnamed_addr constant [45 x i8] c"Enter coordinate (column then row, e.g. A1)\0A\00", align 1
@.str.35 = private unnamed_addr constant [6 x i8] c" %c%d\00", align 1
@.str.36 = private unnamed_addr constant [35 x i8] c"Column must be between 'A' and %c\0A\00", align 1
@.str.37 = private unnamed_addr constant [30 x i8] c"Row must be between 1 and %d\0A\00", align 1
@.str.29 = private unnamed_addr constant [7 x i8] c"a != 0\00", align 1
@.str.15 = private unnamed_addr constant [58 x i8] c"/u7/djholtby/cs136/s21/skeletons/A5/q4-minesweeper/game.c\00", align 1
@__PRETTY_FUNCTION__.get_char_value = private unnamed_addr constant [54 x i8] c"void get_char_value(char *, const char *, char, char)\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"b != 0\00", align 1
@.str.31 = private unnamed_addr constant [4 x i8] c"msg\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"dest\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.33 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.22 = private unnamed_addr constant [44 x i8] c"\0AOOPS!  Looks like it's EOF time, bye now!\0A\00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"__|\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"_%c_\00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.27 = private unnamed_addr constant [5 x i8] c"%2d|\00", align 1
@.str.28 = private unnamed_addr constant [5 x i8] c" %c \00", align 1
@__PRETTY_FUNCTION__.get_int_value = private unnamed_addr constant [50 x i8] c"void get_int_value(int *, const char *, int, int)\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str.17 = private unnamed_addr constant [11 x i8] c"min <= max\00", align 1
@.str.18 = private unnamed_addr constant [18 x i8] c"Enter %s (%d-%d)\0A\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.20 = private unnamed_addr constant [34 x i8] c"I'm sorry, that wasn't a number! \00", align 1
@.str.21 = private unnamed_addr constant [42 x i8] c"I'm sorry, %s must be between %d and %d! \00", align 1

; Function Attrs: noinline nounwind optnone
define void @play_minesweeper() #0 {
entry:
  %grid = alloca [256 x i8], align 16
  %mines = alloca [99 x %struct.posn], align 16
  %b = alloca %struct.ms_board, align 8
  %seed = alloca i32, align 4
  %command = alloca i8, align 1
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %i = alloca i32, align 4
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %grid, i64 0, i64 0
  %board = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 2
  store i8* %arraydecay, i8** %board, align 8
  %arraydecay1 = getelementptr inbounds [99 x %struct.posn], [99 x %struct.posn]* %mines, i64 0, i64 0
  %mines2 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 4
  store %struct.posn* %arraydecay1, %struct.posn** %mines2, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0))
  br label %for.cond

for.cond:                                         ; preds = %if.end40, %entry
  %width = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 0
  call void @get_int_value(i32* %width, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 4, i32 16)
  %height = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 1
  call void @get_int_value(i32* %height, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i32 4, i32 16)
  %num_mines = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 3
  %width3 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 0
  %0 = load i32, i32* %width3, align 8
  %height4 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 1
  %1 = load i32, i32* %height4, align 4
  %mul = mul nsw i32 %0, %1
  %call5 = call i32 @min(i32 99, i32 %mul)
  call void @get_int_value(i32* %num_mines, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 1, i32 %call5)
  store i32 0, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.cond
  %2 = load i32, i32* %i, align 4
  %width7 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 0
  %3 = load i32, i32* %width7, align 8
  %height8 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 1
  %4 = load i32, i32* %height8, align 4
  %mul9 = mul nsw i32 %3, %4
  %cmp = icmp slt i32 %2, %mul9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond6
  %board10 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 2
  %5 = load i8*, i8** %board10, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom
  store i8 32, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.4, i64 0, i64 0))
  call void @get_int_value(i32* %seed, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0), i32 0, i32 9999)
  %8 = load i32, i32* %seed, align 4
  call void @setup_board(%struct.ms_board* %b, i32 %8)
  call void @print_board(%struct.ms_board* %b)
  br label %do.body

do.body:                                          ; preds = %lor.end, %for.end
  call void @get_char_value(i8* %command, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.6, i64 0, i64 0), i8 signext 102, i8 signext 114)
  %width12 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 0
  %9 = load i32, i32* %width12, align 8
  %height13 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 1
  %10 = load i32, i32* %height13, align 4
  call void @get_coordinates(i32* %x, i32* %y, i32 %9, i32 %10)
  %11 = load i32, i32* %x, align 4
  %add = add nsw i32 65, %11
  %sub = sub nsw i32 %add, 1
  %12 = load i32, i32* %y, align 4
  %13 = load i32, i32* %x, align 4
  %14 = load i32, i32* %y, align 4
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.7, i64 0, i64 0), i32 %sub, i32 %12, i32 %13, i32 %14)
  %15 = load i8, i8* %command, align 1
  %conv = sext i8 %15 to i32
  %cmp15 = icmp eq i32 %conv, 70
  br i1 %cmp15, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  %16 = load i32, i32* %x, align 4
  %17 = load i32, i32* %y, align 4
  %call17 = call zeroext i1 @flag(%struct.ms_board* %b, i32 %16, i32 %17)
  br i1 %call17, label %if.end, label %if.then18

if.then18:                                        ; preds = %if.then
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.8, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.then18, %if.then
  br label %if.end24

if.else:                                          ; preds = %do.body
  %18 = load i32, i32* %x, align 4
  %19 = load i32, i32* %y, align 4
  %call20 = call zeroext i1 @reveal(%struct.ms_board* %b, i32 %18, i32 %19)
  br i1 %call20, label %if.end23, label %if.then21

if.then21:                                        ; preds = %if.else
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i64 0, i64 0))
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.else
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.end
  call void @print_board(%struct.ms_board* %b)
  br label %do.cond

do.cond:                                          ; preds = %if.end24
  %call25 = call zeroext i1 @game_lost(%struct.ms_board* %b)
  br i1 %call25, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %do.cond
  %call27 = call zeroext i1 @game_won(%struct.ms_board* %b)
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %do.cond
  %20 = phi i1 [ true, %do.cond ], [ %call27, %lor.rhs ]
  %lnot = xor i1 %20, true
  br i1 %lnot, label %do.body, label %do.end

do.end:                                           ; preds = %lor.end
  %call29 = call zeroext i1 @game_won(%struct.ms_board* %b)
  br i1 %call29, label %if.then30, label %if.else32

if.then30:                                        ; preds = %do.end
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @face, i64 0, i64 0))
  br label %if.end34

if.else32:                                        ; preds = %do.end
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @uded, i64 0, i64 0))
  br label %if.end34

if.end34:                                         ; preds = %if.else32, %if.then30
  call void @get_char_value(i8* %command, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.12, i64 0, i64 0), i8 signext 121, i8 signext 110)
  %21 = load i8, i8* %command, align 1
  %conv35 = sext i8 %21 to i32
  %cmp36 = icmp eq i32 %conv35, 78
  br i1 %cmp36, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.end34
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13, i64 0, i64 0))
  br label %for.end41

if.end40:                                         ; preds = %if.end34
  br label %for.cond

for.end41:                                        ; preds = %if.then38
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone
define internal void @get_int_value(i32* %dest, i8* %name, i32 %min, i32 %max) #0 {
entry:
  %dest.addr = alloca i32*, align 8
  %name.addr = alloca i8*, align 8
  %min.addr = alloca i32, align 4
  %max.addr = alloca i32, align 4
  %rc = alloca i32, align 4
  store i32* %dest, i32** %dest.addr, align 8
  store i8* %name, i8** %name.addr, align 8
  store i32 %min, i32* %min.addr, align 4
  store i32 %max, i32* %max.addr, align 4
  %0 = load i32*, i32** %dest.addr, align 8
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.15, i64 0, i64 0), i32 82, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.get_int_value, i64 0, i64 0)) #4
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %name.addr, align 8
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  br label %if.end4

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.15, i64 0, i64 0), i32 83, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.get_int_value, i64 0, i64 0)) #4
  unreachable

if.end4:                                          ; preds = %if.then2
  %2 = load i32, i32* %min.addr, align 4
  %3 = load i32, i32* %max.addr, align 4
  %cmp = icmp sle i32 %2, %3
  br i1 %cmp, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.end4
  br label %if.end7

if.else6:                                         ; preds = %if.end4
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.15, i64 0, i64 0), i32 84, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.get_int_value, i64 0, i64 0)) #4
  unreachable

if.end7:                                          ; preds = %if.then5
  br label %for.cond

for.cond:                                         ; preds = %if.end23, %if.end7
  %4 = load i8*, i8** %name.addr, align 8
  %5 = load i32, i32* %min.addr, align 4
  %6 = load i32, i32* %max.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.18, i64 0, i64 0), i8* %4, i32 %5, i32 %6)
  %7 = load i32*, i32** %dest.addr, align 8
  %call8 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i64 0, i64 0), i32* %7)
  store i32 %call8, i32* %rc, align 4
  %8 = load i32, i32* %rc, align 4
  %cmp9 = icmp slt i32 %8, 0
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %for.cond
  call void @abrupt_end()
  br label %if.end23

if.else11:                                        ; preds = %for.cond
  %9 = load i32, i32* %rc, align 4
  %cmp12 = icmp eq i32 %9, 0
  br i1 %cmp12, label %if.then13, label %if.else15

if.then13:                                        ; preds = %if.else11
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.20, i64 0, i64 0))
  call void @chomp_line()
  br label %if.end22

if.else15:                                        ; preds = %if.else11
  %10 = load i32*, i32** %dest.addr, align 8
  %11 = load i32, i32* %10, align 4
  %12 = load i32, i32* %min.addr, align 4
  %cmp16 = icmp slt i32 %11, %12
  br i1 %cmp16, label %if.then18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else15
  %13 = load i32*, i32** %dest.addr, align 8
  %14 = load i32, i32* %13, align 4
  %15 = load i32, i32* %max.addr, align 4
  %cmp17 = icmp sgt i32 %14, %15
  br i1 %cmp17, label %if.then18, label %if.else20

if.then18:                                        ; preds = %lor.lhs.false, %if.else15
  %16 = load i8*, i8** %name.addr, align 8
  %17 = load i32, i32* %min.addr, align 4
  %18 = load i32, i32* %max.addr, align 4
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.21, i64 0, i64 0), i8* %16, i32 %17, i32 %18)
  br label %if.end21

if.else20:                                        ; preds = %lor.lhs.false
  br label %for.end

if.end21:                                         ; preds = %if.then18
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then13
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then10
  br label %for.cond

for.end:                                          ; preds = %if.else20
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal i32 @min(i32 %a, i32 %b) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* %b.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ %3, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind optnone
define internal void @setup_board(%struct.ms_board* %b, i32 %seed) #0 {
entry:
  %b.addr = alloca %struct.ms_board*, align 8
  %seed.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %valid = alloca i8, align 1
  %j = alloca i32, align 4
  store %struct.ms_board* %b, %struct.ms_board** %b.addr, align 8
  store i32 %seed, i32* %seed.addr, align 4
  %0 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width = getelementptr inbounds %struct.ms_board, %struct.ms_board* %0, i32 0, i32 0
  %1 = load i32, i32* %width, align 8
  %2 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %height = getelementptr inbounds %struct.ms_board, %struct.ms_board* %2, i32 0, i32 1
  %3 = load i32, i32* %height, align 4
  %mul = mul nsw i32 %1, %3
  store i32 %mul, i32* %len, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %len, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %board = getelementptr inbounds %struct.ms_board, %struct.ms_board* %6, i32 0, i32 2
  %7 = load i8*, i8** %board, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %idxprom
  store i8 32, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %seed.addr, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  %11 = load i32, i32* %seed.addr, align 4
  call void @srand(i32 %11) #5
  br label %if.end

if.else:                                          ; preds = %for.end
  %call = call i64 @time(i64* null) #5
  %conv = trunc i64 %call to i32
  call void @srand(i32 %conv) #5
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* %i1, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc41, %if.end
  %12 = load i32, i32* %i1, align 4
  %13 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %num_mines = getelementptr inbounds %struct.ms_board, %struct.ms_board* %13, i32 0, i32 3
  %14 = load i32, i32* %num_mines, align 8
  %cmp3 = icmp slt i32 %12, %14
  br i1 %cmp3, label %for.body5, label %for.end43

for.body5:                                        ; preds = %for.cond2
  store i8 1, i8* %valid, align 1
  br label %do.body

do.body:                                          ; preds = %do.cond, %for.body5
  %call6 = call i32 @rand() #5
  %15 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width7 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %15, i32 0, i32 0
  %16 = load i32, i32* %width7, align 8
  %rem = srem i32 %call6, %16
  %add = add nsw i32 %rem, 1
  store i32 %add, i32* %x, align 4
  %call8 = call i32 @rand() #5
  %17 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %height9 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %17, i32 0, i32 1
  %18 = load i32, i32* %height9, align 4
  %rem10 = srem i32 %call8, %18
  %add11 = add nsw i32 %rem10, 1
  store i32 %add11, i32* %y, align 4
  store i8 1, i8* %valid, align 1
  store i32 0, i32* %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc29, %do.body
  %19 = load i32, i32* %j, align 4
  %20 = load i32, i32* %i1, align 4
  %cmp13 = icmp slt i32 %19, %20
  br i1 %cmp13, label %for.body15, label %for.end31

for.body15:                                       ; preds = %for.cond12
  %21 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %mines = getelementptr inbounds %struct.ms_board, %struct.ms_board* %21, i32 0, i32 4
  %22 = load %struct.posn*, %struct.posn** %mines, align 8
  %23 = load i32, i32* %j, align 4
  %idxprom16 = sext i32 %23 to i64
  %arrayidx17 = getelementptr inbounds %struct.posn, %struct.posn* %22, i64 %idxprom16
  %x18 = getelementptr inbounds %struct.posn, %struct.posn* %arrayidx17, i32 0, i32 0
  %24 = load i32, i32* %x18, align 4
  %25 = load i32, i32* %x, align 4
  %cmp19 = icmp eq i32 %24, %25
  br i1 %cmp19, label %land.lhs.true, label %if.end28

land.lhs.true:                                    ; preds = %for.body15
  %26 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %mines21 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %26, i32 0, i32 4
  %27 = load %struct.posn*, %struct.posn** %mines21, align 8
  %28 = load i32, i32* %j, align 4
  %idxprom22 = sext i32 %28 to i64
  %arrayidx23 = getelementptr inbounds %struct.posn, %struct.posn* %27, i64 %idxprom22
  %y24 = getelementptr inbounds %struct.posn, %struct.posn* %arrayidx23, i32 0, i32 1
  %29 = load i32, i32* %y24, align 4
  %30 = load i32, i32* %y, align 4
  %cmp25 = icmp eq i32 %29, %30
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %land.lhs.true
  store i8 0, i8* %valid, align 1
  br label %for.end31

if.end28:                                         ; preds = %land.lhs.true, %for.body15
  br label %for.inc29

for.inc29:                                        ; preds = %if.end28
  %31 = load i32, i32* %j, align 4
  %inc30 = add nsw i32 %31, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond12

for.end31:                                        ; preds = %if.then27, %for.cond12
  br label %do.cond

do.cond:                                          ; preds = %for.end31
  %32 = load i8, i8* %valid, align 1
  %tobool32 = trunc i8 %32 to i1
  %lnot = xor i1 %tobool32, true
  br i1 %lnot, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %33 = load i32, i32* %x, align 4
  %34 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %mines33 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %34, i32 0, i32 4
  %35 = load %struct.posn*, %struct.posn** %mines33, align 8
  %36 = load i32, i32* %i1, align 4
  %idxprom34 = sext i32 %36 to i64
  %arrayidx35 = getelementptr inbounds %struct.posn, %struct.posn* %35, i64 %idxprom34
  %x36 = getelementptr inbounds %struct.posn, %struct.posn* %arrayidx35, i32 0, i32 0
  store i32 %33, i32* %x36, align 4
  %37 = load i32, i32* %y, align 4
  %38 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %mines37 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %38, i32 0, i32 4
  %39 = load %struct.posn*, %struct.posn** %mines37, align 8
  %40 = load i32, i32* %i1, align 4
  %idxprom38 = sext i32 %40 to i64
  %arrayidx39 = getelementptr inbounds %struct.posn, %struct.posn* %39, i64 %idxprom38
  %y40 = getelementptr inbounds %struct.posn, %struct.posn* %arrayidx39, i32 0, i32 1
  store i32 %37, i32* %y40, align 4
  br label %for.inc41

for.inc41:                                        ; preds = %do.end
  %41 = load i32, i32* %i1, align 4
  %inc42 = add nsw i32 %41, 1
  store i32 %inc42, i32* %i1, align 4
  br label %for.cond2

for.end43:                                        ; preds = %for.cond2
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @print_board(%struct.ms_board* %b) #0 {
entry:
  %b.addr = alloca %struct.ms_board*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %x7 = alloca i32, align 4
  store %struct.ms_board* %b, %struct.ms_board** %b.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i64 0, i64 0))
  store i32 1, i32* %x, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %x, align 4
  %1 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width = getelementptr inbounds %struct.ms_board, %struct.ms_board* %1, i32 0, i32 0
  %2 = load i32, i32* %width, align 8
  %cmp = icmp sle i32 %0, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %x, align 4
  %add = add nsw i32 65, %3
  %sub = sub nsw i32 %add, 1
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i32 %sub)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %x, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.26, i64 0, i64 0))
  store i32 1, i32* %y, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc21, %for.end
  %5 = load i32, i32* %y, align 4
  %6 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %height = getelementptr inbounds %struct.ms_board, %struct.ms_board* %6, i32 0, i32 1
  %7 = load i32, i32* %height, align 4
  %cmp4 = icmp sle i32 %5, %7
  br i1 %cmp4, label %for.body5, label %for.end23

for.body5:                                        ; preds = %for.cond3
  %8 = load i32, i32* %y, align 4
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.27, i64 0, i64 0), i32 %8)
  store i32 1, i32* %x7, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc17, %for.body5
  %9 = load i32, i32* %x7, align 4
  %10 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width9 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %10, i32 0, i32 0
  %11 = load i32, i32* %width9, align 8
  %cmp10 = icmp sle i32 %9, %11
  br i1 %cmp10, label %for.body11, label %for.end19

for.body11:                                       ; preds = %for.cond8
  %12 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %board = getelementptr inbounds %struct.ms_board, %struct.ms_board* %12, i32 0, i32 2
  %13 = load i8*, i8** %board, align 8
  %14 = load i32, i32* %y, align 4
  %sub12 = sub nsw i32 %14, 1
  %15 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width13 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %15, i32 0, i32 0
  %16 = load i32, i32* %width13, align 8
  %mul = mul nsw i32 %sub12, %16
  %17 = load i32, i32* %x7, align 4
  %sub14 = sub nsw i32 %17, 1
  %add15 = add nsw i32 %mul, %sub14
  %idxprom = sext i32 %add15 to i64
  %arrayidx = getelementptr inbounds i8, i8* %13, i64 %idxprom
  %18 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %18 to i32
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 %conv)
  br label %for.inc17

for.inc17:                                        ; preds = %for.body11
  %19 = load i32, i32* %x7, align 4
  %inc18 = add nsw i32 %19, 1
  store i32 %inc18, i32* %x7, align 4
  br label %for.cond8

for.end19:                                        ; preds = %for.cond8
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.26, i64 0, i64 0))
  br label %for.inc21

for.inc21:                                        ; preds = %for.end19
  %20 = load i32, i32* %y, align 4
  %inc22 = add nsw i32 %20, 1
  store i32 %inc22, i32* %y, align 4
  br label %for.cond3

for.end23:                                        ; preds = %for.cond3
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @get_char_value(i8* %dest, i8* %msg, i8 signext %a, i8 signext %b) #0 {
entry:
  %dest.addr = alloca i8*, align 8
  %msg.addr = alloca i8*, align 8
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  %rc = alloca i32, align 4
  store i8* %dest, i8** %dest.addr, align 8
  store i8* %msg, i8** %msg.addr, align 8
  store i8 %a, i8* %a.addr, align 1
  store i8 %b, i8* %b.addr, align 1
  %0 = load i8, i8* %a.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.15, i64 0, i64 0), i32 113, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.get_char_value, i64 0, i64 0)) #4
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load i8, i8* %b.addr, align 1
  %conv2 = sext i8 %1 to i32
  %cmp3 = icmp ne i32 %conv2, 0
  br i1 %cmp3, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.end
  br label %if.end7

if.else6:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.15, i64 0, i64 0), i32 114, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.get_char_value, i64 0, i64 0)) #4
  unreachable

if.end7:                                          ; preds = %if.then5
  %2 = load i8*, i8** %msg.addr, align 8
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.end7
  br label %if.end10

if.else9:                                         ; preds = %if.end7
  call void @__assert_fail(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.31, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.15, i64 0, i64 0), i32 115, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.get_char_value, i64 0, i64 0)) #4
  unreachable

if.end10:                                         ; preds = %if.then8
  %3 = load i8*, i8** %dest.addr, align 8
  %tobool11 = icmp ne i8* %3, null
  br i1 %tobool11, label %if.then12, label %if.else13

if.then12:                                        ; preds = %if.end10
  br label %if.end14

if.else13:                                        ; preds = %if.end10
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.15, i64 0, i64 0), i32 116, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.get_char_value, i64 0, i64 0)) #4
  unreachable

if.end14:                                         ; preds = %if.then12
  %4 = load i8, i8* %a.addr, align 1
  %call = call signext i8 @to_upper(i8 signext %4)
  store i8 %call, i8* %a.addr, align 1
  %5 = load i8, i8* %b.addr, align 1
  %call15 = call signext i8 @to_upper(i8 signext %5)
  store i8 %call15, i8* %b.addr, align 1
  %6 = load i8*, i8** %dest.addr, align 8
  store i8 0, i8* %6, align 1
  br label %do.body

do.body:                                          ; preds = %land.end, %if.end14
  %7 = load i8*, i8** %msg.addr, align 8
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i64 0, i64 0), i8* %7)
  %8 = load i8*, i8** %dest.addr, align 8
  %call17 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i64 0, i64 0), i8* %8)
  store i32 %call17, i32* %rc, align 4
  %9 = load i8*, i8** %dest.addr, align 8
  %10 = load i8, i8* %9, align 1
  %call18 = call signext i8 @to_upper(i8 signext %10)
  %11 = load i8*, i8** %dest.addr, align 8
  store i8 %call18, i8* %11, align 1
  %12 = load i32, i32* %rc, align 4
  %cmp19 = icmp slt i32 %12, 0
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %do.body
  call void @abrupt_end()
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %do.body
  call void @chomp_line()
  br label %do.cond

do.cond:                                          ; preds = %if.end22
  %13 = load i8*, i8** %dest.addr, align 8
  %14 = load i8, i8* %13, align 1
  %conv23 = sext i8 %14 to i32
  %15 = load i8, i8* %a.addr, align 1
  %conv24 = sext i8 %15 to i32
  %cmp25 = icmp ne i32 %conv23, %conv24
  br i1 %cmp25, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.cond
  %16 = load i8*, i8** %dest.addr, align 8
  %17 = load i8, i8* %16, align 1
  %conv27 = sext i8 %17 to i32
  %18 = load i8, i8* %b.addr, align 1
  %conv28 = sext i8 %18 to i32
  %cmp29 = icmp ne i32 %conv27, %conv28
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %19 = phi i1 [ false, %do.cond ], [ %cmp29, %land.rhs ]
  br i1 %19, label %do.body, label %do.end

do.end:                                           ; preds = %land.end
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @get_coordinates(i32* %x, i32* %y, i32 %w, i32 %h) #0 {
entry:
  %x.addr = alloca i32*, align 8
  %y.addr = alloca i32*, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %rc = alloca i32, align 4
  %col = alloca i8, align 1
  %row = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i32* %y, i32** %y.addr, align 8
  store i32 %w, i32* %w.addr, align 4
  store i32 %h, i32* %h.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.then18, %if.then, %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.34, i64 0, i64 0))
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.35, i64 0, i64 0), i8* %col, i32* %row)
  store i32 %call1, i32* %rc, align 4
  %0 = load i8, i8* %col, align 1
  %call2 = call signext i8 @to_upper(i8 signext %0)
  store i8 %call2, i8* %col, align 1
  %1 = load i8, i8* %col, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp slt i32 %conv, 65
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.cond
  %2 = load i8, i8* %col, align 1
  %conv4 = sext i8 %2 to i32
  %3 = load i32, i32* %w.addr, align 4
  %add = add nsw i32 65, %3
  %sub = sub nsw i32 %add, 1
  %cmp5 = icmp sgt i32 %conv4, %sub
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.cond
  %4 = load i32, i32* %w.addr, align 4
  %add7 = add nsw i32 65, %4
  %sub8 = sub nsw i32 %add7, 1
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.36, i64 0, i64 0), i32 %sub8)
  br label %for.cond

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i8, i8* %col, align 1
  %conv10 = sext i8 %5 to i32
  %sub11 = sub nsw i32 %conv10, 65
  %add12 = add nsw i32 %sub11, 1
  %6 = load i32*, i32** %x.addr, align 8
  store i32 %add12, i32* %6, align 4
  %7 = load i32, i32* %row, align 4
  %cmp13 = icmp slt i32 %7, 1
  br i1 %cmp13, label %if.then18, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %if.end
  %8 = load i32, i32* %row, align 4
  %9 = load i32, i32* %h.addr, align 4
  %cmp16 = icmp sgt i32 %8, %9
  br i1 %cmp16, label %if.then18, label %if.end20

if.then18:                                        ; preds = %lor.lhs.false15, %if.end
  %10 = load i32, i32* %h.addr, align 4
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.37, i64 0, i64 0), i32 %10)
  br label %for.cond

if.end20:                                         ; preds = %lor.lhs.false15
  %11 = load i32, i32* %row, align 4
  %12 = load i32*, i32** %y.addr, align 8
  store i32 %11, i32* %12, align 4
  ret void
}

declare zeroext i1 @flag(%struct.ms_board*, i32, i32) #1

declare zeroext i1 @reveal(%struct.ms_board*, i32, i32) #1

declare zeroext i1 @game_lost(%struct.ms_board*) #1

declare zeroext i1 @game_won(%struct.ms_board*) #1

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone
define internal signext i8 @to_upper(i8 signext %c) #0 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %0 = load i8, i8* %c.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp sge i32 %conv, 97
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %c.addr, align 1
  %conv2 = sext i8 %1 to i32
  %cmp3 = icmp sle i32 %conv2, 122
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8, i8* %c.addr, align 1
  %conv5 = sext i8 %2 to i32
  %sub = sub nsw i32 %conv5, 97
  %add = add nsw i32 %sub, 65
  %conv6 = trunc i32 %add to i8
  store i8 %conv6, i8* %c.addr, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %3 = load i8, i8* %c.addr, align 1
  ret i8 %3
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: noinline nounwind optnone
define internal void @abrupt_end() #0 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.22, i64 0, i64 0))
  call void @exit(i32 0) #4
  unreachable
}

; Function Attrs: noinline nounwind optnone
define internal void @chomp_line() #0 {
entry:
  %c = alloca i8, align 1
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i64 0, i64 0), i8* %c)
  %cmp = icmp slt i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @abrupt_end()
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %0 = load i8, i8* %c, align 1
  %conv = sext i8 %0 to i32
  %cmp1 = icmp ne i32 %conv, 10
  br i1 %cmp1, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare void @srand(i32) #3

; Function Attrs: nounwind
declare i64 @time(i64*) #3

; Function Attrs: nounwind
declare i32 @rand() #3

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!1 = !{i32 1, !"wchar_size", i32 4}
