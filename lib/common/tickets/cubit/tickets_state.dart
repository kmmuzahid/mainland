import 'package:equatable/equatable.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';

class TicketsState extends Equatable {
  const TicketsState({this.selectedFilter, this.tickets = const []});

  final List<TicketModel> tickets;
  final TicketFilter? selectedFilter;

  TicketsState copyWith({List<TicketModel>? tickets, TicketFilter? selectedFilter}) {
    return TicketsState(
      tickets: tickets ?? this.tickets,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  @override
  List<Object?> get props => [tickets, selectedFilter];
}
