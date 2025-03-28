import 'dart:math';
import 'package:flutter/material.dart';

enum Side { left, top, right, bottom }


class FluidEdge extends ChangeNotifier {
  List<_FluidPoint> points = [];
  Side side;
  double edgeTension = 0.01;
  double farEdgeTension = 0.0;
  double touchTension = 0.1;
  double pointTension = 0.25;
  double damping = 0.9;
  double maxTouchDistance = 0.15;
  int lastT = 0;

  FractionalOffset? touchOffset;

  FluidEdge({count = 10, this.side = Side.left}) {
    for (int i = 0; i < count; i++) {
      points.add(_FluidPoint(0.0, i / (count - 1)));
    }
  }

  void reset() {
    points.forEach((pt) => pt.x = pt.velX = pt.velY = 0.0);
  }

  void applyTouchOffset([Offset? offset, Size size = Size.zero]) {
    if (offset == null) {
      touchOffset = null;
      return;
    }
    final fraction = FractionalOffset.fromOffsetAndSize(offset, size);
    if (side == Side.left) {
      touchOffset = fraction;
    } else if (side == Side.right) {
      touchOffset = FractionalOffset(1.0 - fraction.dx, 1.0 - fraction.dy);
    } else if (side == Side.top) {
      touchOffset = FractionalOffset(fraction.dy, 1.0 - fraction.dx);
    } else {
      touchOffset = FractionalOffset(1.0 - fraction.dy, fraction.dx);
    }
  }

  Path buildPath(Size size, {double margin = 0.0}) {
    if (points.isEmpty) {
      return Path();
    }

    Matrix4 mtx = _getTransform(size, margin);

    Path path = Path();
    int l = points.length;
    Offset pt = _FluidPoint(-margin, 1.0).toOffset(mtx), pt1;
    path.moveTo(pt.dx, pt.dy);

    pt = _FluidPoint(-margin, 0.0).toOffset(mtx);
    path.lineTo(pt.dx, pt.dy);

    pt = points[0].toOffset(mtx);
    path.lineTo(pt.dx, pt.dy);

    pt1 = points[1].toOffset(mtx);
    path.lineTo(pt.dx + (pt1.dx - pt.dx) / 2, pt.dy + (pt1.dy - pt.dy) / 2);

    for (int i = 2; i < l; i++) {
      pt = pt1;
      pt1 = points[i].toOffset(mtx);
      double midX = pt.dx + (pt1.dx - pt.dx) / 2;
      double midY = pt.dy + (pt1.dy - pt.dy) / 2;
      path.quadraticBezierTo(pt.dx, pt.dy, midX, midY);
    }

    path.lineTo(pt1.dx, pt1.dy);
    path.close();

    return path;
  }

  void tick(Duration duration) {
    if (points.isEmpty) {
      return;
    }
    int l = points.length;
    double t = min(1.5, (duration.inMilliseconds - lastT) / 1000 * 60);
    lastT = duration.inMilliseconds;
    double dampingT = pow(damping, t) as double;

    for (int i = 0; i < l; i++) {
      _FluidPoint pt = points[i];
      pt.velX -= pt.x * edgeTension * t;
      pt.velX += (1.0 - pt.x) * farEdgeTension * t;
      if (touchOffset != null) {
        double ratio = max(0.0, 1.0 - (pt.y - touchOffset!.dy).abs() / maxTouchDistance);
        pt.velX += (touchOffset!.dx - pt.x) * touchTension * ratio * t;
      }
      if (i > 0) {
        _addPointTension(pt, points[i - 1].x, t);
      }
      if (i < l - 1) {
        _addPointTension(pt, points[i + 1].x, t);
      }
      pt.velX *= dampingT;
    }

    for (int i = 0; i < l; i++) {
      _FluidPoint pt = points[i];
      pt.x += pt.velX * t;
    }
    notifyListeners();
  }

  Matrix4 _getTransform(Size size, double margin) {
    bool vertical = side == Side.top || side == Side.bottom;
    double w = (vertical ? size.height : size.width) + margin * 2;
    double h = (vertical ? size.width : size.height) + margin * 2;

    Matrix4 mtx = Matrix4.identity()
      ..translate(-margin, 0.0)
      ..scale(w, h);
    if (side == Side.top) {
      mtx
        ..rotateZ(pi / 2)
        ..translate(0.0, -1.0);
    } else if (side == Side.right) {
      mtx
        ..rotateZ(pi)
        ..translate(-1.0, -1.0);
    } else if (side == Side.bottom) {
      mtx
        ..rotateZ(pi * 3 / 2)
        ..translate(-1.0, 0.0);
    }

    return mtx;
  }

  void _addPointTension(_FluidPoint pt0, double x, double t) {
    pt0.velX += (x - pt0.x) * pointTension * t;
  }
}

class _FluidPoint {
  double x;
  double y;
  double velX = 0.0;
  double velY = 0.0;

  _FluidPoint([this.x = 0.0, this.y = 0.0]);

  Offset toOffset([Matrix4? transform]) {
    Offset o = Offset(x, y);
    if (transform == null) {
      return o;
    }
    return MatrixUtils.transformPoint(transform, o);
  }
}