import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'video_model.dart';
export 'video_model.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    super.key,
    required this.lesson,
  });

  final LessonsRecord? lesson;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget>
    with TickerProviderStateMixin {
  late VideoModel _model;

  final animationsMap = {
    'textOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 2000.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(100.0, -37.0),
        ),
        MoveEffect(
          curve: Curves.linear,
          delay: 2000.ms,
          duration: 2000.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(100.0, 35.0),
        ),
        MoveEffect(
          curve: Curves.linear,
          delay: 1920.ms,
          duration: 2000.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(100.0, 100.0),
        ),
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 2000.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(100.0, 100.0),
        ),
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 2000.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(100.0, 100.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.endloop) {
        if (animationsMap['textOnActionTriggerAnimation'] != null) {
          await animationsMap['textOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
        await Future.delayed(const Duration(milliseconds: 3000));
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
        child: Container(
          decoration: const BoxDecoration(),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: const AlignmentDirectional(-0.0, 0.0),
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.98,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: custom_widgets.YoutubePlayerWidget(
                        width: MediaQuery.sizeOf(context).width * 0.98,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        url: widget.lesson!.youtube,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 45.0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Transform.translate(
                      offset: const Offset(8.0, 65.0),
                      child: Opacity(
                        opacity: 0.7,
                        child: Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentPhoneNumber,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFFBDBDBD),
                                    fontSize: 28.0,
                                  ),
                            ).animateOnActionTrigger(
                              animationsMap['textOnActionTriggerAnimation']!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
