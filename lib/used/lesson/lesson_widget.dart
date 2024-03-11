import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/video/video_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'lesson_model.dart';
export 'lesson_model.dart';

class LessonWidget extends StatefulWidget {
  const LessonWidget({
    super.key,
    required this.courseRef,
    required this.orderRef,
  });

  final DocumentReference? courseRef;
  final DocumentReference? orderRef;

  @override
  State<LessonWidget> createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  late LessonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.lessonList = false;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrdersRecord>(
      stream: OrdersRecord.getDocument(widget.orderRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final lessonOrdersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32.0,
              ),
            ),
            title: Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: Text(
                'تفاصيل الدرس',
                textAlign: TextAlign.end,
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(),
              child: SizedBox(
                width: 974.0,
                height: double.infinity,
                child: Stack(
                  alignment: const AlignmentDirectional(-0.0, 0.0),
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<LessonsRecord>>(
                                    stream: queryLessonsRecord(
                                      queryBuilder: (lessonsRecord) =>
                                          lessonsRecord
                                              .where(
                                                'courseRef',
                                                isEqualTo: widget.courseRef,
                                              )
                                              .orderBy('lessonNumber'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<LessonsRecord>
                                          pageViewLessonsRecordList =
                                          snapshot.data!;
                                      return SizedBox(
                                        width: double.infinity,
                                        height: 800.0,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: PageView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        pageViewLessonsRecordList
                                                                .length -
                                                            1)),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: pageViewLessonsRecordList
                                                .length,
                                            itemBuilder:
                                                (context, pageViewIndex) {
                                              final pageViewLessonsRecord =
                                                  pageViewLessonsRecordList[
                                                      pageViewIndex];
                                              return FutureBuilder<int>(
                                                future: queryLessonsRecordCount(
                                                  queryBuilder:
                                                      (lessonsRecord) =>
                                                          lessonsRecord.where(
                                                    'courseRef',
                                                    isEqualTo: widget.courseRef,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  int columnCount =
                                                      snapshot.data!;
                                                  return SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                CompletedLessonsRecord>>(
                                                          stream:
                                                              queryCompletedLessonsRecord(
                                                            parent:
                                                                widget.orderRef,
                                                            queryBuilder:
                                                                (completedLessonsRecord) =>
                                                                    completedLessonsRecord
                                                                        .where(
                                                              'completedLessons',
                                                              isEqualTo:
                                                                  pageViewLessonsRecord
                                                                      .reference,
                                                            ),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<CompletedLessonsRecord>
                                                                columnCompletedLessonsRecordList =
                                                                snapshot.data!;
                                                            final columnCompletedLessonsRecord =
                                                                columnCompletedLessonsRecordList
                                                                        .isNotEmpty
                                                                    ? columnCompletedLessonsRecordList
                                                                        .first
                                                                    : null;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FutureBuilder<
                                                                    int>(
                                                                  future:
                                                                      queryCompletedLessonsRecordCount(
                                                                    parent: widget
                                                                        .orderRef,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    int columnMainContentCount =
                                                                        snapshot
                                                                            .data!;
                                                                    return SingleChildScrollView(
                                                                      primary:
                                                                          false,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                15.0,
                                                                                12.0,
                                                                                15.0),
                                                                            child:
                                                                                LinearPercentIndicator(
                                                                              percent: columnMainContentCount != 0 ? functions.percentageOf1(columnMainContentCount, columnCount) : 0.0,
                                                                              width: MediaQuery.sizeOf(context).width * 0.9,
                                                                              lineHeight: 25.0,
                                                                              animation: true,
                                                                              animateFromLastPercent: true,
                                                                              progressColor: FlutterFlowTheme.of(context).primary,
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                              center: Text(
                                                                                functions.percentageOf100(columnMainContentCount, columnCount)!,
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 20.0,
                                                                                    ),
                                                                              ),
                                                                              barRadius: const Radius.circular(20.0),
                                                                              padding: EdgeInsets.zero,
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: SizedBox(
                                                                                              height: double.infinity,
                                                                                              child: VideoWidget(
                                                                                                lesson: pageViewLessonsRecord,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    },
                                                                                    child: Stack(
                                                                                      alignment: const AlignmentDirectional(-0.0, 0.0),
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(4.71, 0.0),
                                                                                          child: Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                                                                                                child: SizedBox(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  height: 250.0,
                                                                                                  child: custom_widgets.ToutubeThumbnail(
                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                    height: 250.0,
                                                                                                    url: pageViewLessonsRecord.youtube,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Opacity(
                                                                                          opacity: 0.6,
                                                                                          child: Align(
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.play_arrow,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 250.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderColor: FlutterFlowTheme.of(context).primary,
                                                                                    borderRadius: 20.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 40.0,
                                                                                    fillColor: FlutterFlowTheme.of(context).accent1,
                                                                                    icon: FaIcon(
                                                                                      FontAwesomeIcons.bars,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      setState(() {
                                                                                        _model.lessonList = !_model.lessonList;
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                if (_model.lessonList)
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      StreamBuilder<List<LessonsRecord>>(
                                                                                        stream: queryLessonsRecord(
                                                                                          queryBuilder: (lessonsRecord) => lessonsRecord
                                                                                              .where(
                                                                                                'courseRef',
                                                                                                isEqualTo: widget.courseRef,
                                                                                              )
                                                                                              .orderBy('lessonNumber'),
                                                                                        ),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return Center(
                                                                                              child: SizedBox(
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                child: CircularProgressIndicator(
                                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          List<LessonsRecord> listViewLessonsRecordList = snapshot.data!;
                                                                                          return ListView.builder(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: listViewLessonsRecordList.length,
                                                                                            itemBuilder: (context, listViewIndex) {
                                                                                              final listViewLessonsRecord = listViewLessonsRecordList[listViewIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await _model.pageViewController?.animateToPage(
                                                                                                    listViewIndex,
                                                                                                    duration: const Duration(milliseconds: 500),
                                                                                                    curve: Curves.ease,
                                                                                                  );
                                                                                                  setState(() {});
                                                                                                  setState(() {
                                                                                                    _model.lessonList = false;
                                                                                                  });
                                                                                                },
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 12.0),
                                                                                                      child: StreamBuilder<List<CompletedLessonsRecord>>(
                                                                                                        stream: queryCompletedLessonsRecord(
                                                                                                          parent: widget.orderRef,
                                                                                                          queryBuilder: (completedLessonsRecord) => completedLessonsRecord.where(
                                                                                                            'completedLessons',
                                                                                                            isEqualTo: listViewLessonsRecord.reference,
                                                                                                          ),
                                                                                                          singleRecord: true,
                                                                                                        ),
                                                                                                        builder: (context, snapshot) {
                                                                                                          // Customize what your widget looks like when it's loading.
                                                                                                          if (!snapshot.hasData) {
                                                                                                            return Center(
                                                                                                              child: SizedBox(
                                                                                                                width: 50.0,
                                                                                                                height: 50.0,
                                                                                                                child: CircularProgressIndicator(
                                                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                          List<CompletedLessonsRecord> rowCompletedLessonsRecordList = snapshot.data!;
                                                                                                          final rowCompletedLessonsRecord = rowCompletedLessonsRecordList.isNotEmpty ? rowCompletedLessonsRecordList.first : null;
                                                                                                          return Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: 30.0,
                                                                                                                  height: 30.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    borderRadius: BorderRadius.circular(24.0),
                                                                                                                    border: Border.all(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      width: 2.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  child: Visibility(
                                                                                                                    visible: listViewIndex == _model.pageViewCurrentIndex,
                                                                                                                    child: Icon(
                                                                                                                      Icons.check_rounded,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: 44.0,
                                                                                                                  height: 44.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                                    shape: BoxShape.circle,
                                                                                                                    border: Border.all(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    functions.addOne(listViewIndex).toString(),
                                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                          fontFamily: 'Readex Pro',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                  child: Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      listViewLessonsRecord.name,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                            fontFamily: 'Readex Pro',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              if (rowCompletedLessonsRecord?.completedLessons == listViewLessonsRecord.reference)
                                                                                                                Icon(
                                                                                                                  Icons.check_circle_sharp,
                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                  size: 24.0,
                                                                                                                ),
                                                                                                              Icon(
                                                                                                                Icons.chevron_right_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 1.0,
                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          pageViewLessonsRecord.name,
                                                                                          style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          pageViewLessonsRecord.description,
                                                                                          textAlign: TextAlign.end,
                                                                                          style: FlutterFlowTheme.of(context).labelLarge,
                                                                                        ),
                                                                                      ),
                                                                                      if (pageViewLessonsRecord.reference == columnCompletedLessonsRecord?.completedLessons)
                                                                                        Text(
                                                                                          'الدرس مكتمل مسبقا',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                              ),
                                                                                        ),
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 24.0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              await _model.pageViewController?.nextPage(
                                                                                                duration: const Duration(milliseconds: 300),
                                                                                                curve: Curves.ease,
                                                                                              );
                                                                                              setState(() {});
                                                                                              if (columnCompletedLessonsRecord?.completedLessons == pageViewLessonsRecord.reference) {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'لقد اكملت هذه المحاضرة مسبقا',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: const Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                await CompletedLessonsRecord.createDoc(widget.orderRef!).set(createCompletedLessonsRecordData(
                                                                                                  completedLessons: pageViewLessonsRecord.reference,
                                                                                                ));
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'لقد تم  اكمال  المحاضرة',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: const Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              }

                                                                                              if (columnMainContentCount == columnCount) {
                                                                                                await widget.orderRef!.update(createOrdersRecordData(
                                                                                                  courseCompleted: true,
                                                                                                ));

                                                                                                context.goNamed('orders');

                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'مبروك لقد تم  اكمال  الدرس',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: const Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            },
                                                                                            text: 'أكملت المحاضرة  انتقل الى التالي',
                                                                                            options: FFButtonOptions(
                                                                                              width: 353.0,
                                                                                              height: 60.0,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: lessonOrdersRecord.courseCompleted ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).primary,
                                                                                              textStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    color: Colors.white,
                                                                                                  ),
                                                                                              elevation: 3.0,
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
