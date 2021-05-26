// 초대장
struct Invitation {
    private let when: String
}

// 티켓
struct Ticket {
    private let fee: Int
    
    func getFee() -> Int {
        fee
    }
}

// 가방
class Bag {
    private var amount: Int
    private var invitation: Invitation?
    private var ticket: Ticket?
    
    init(_ invitation: Invitation, _ amount: Int) {
        self.invitation = invitation
        self.amount = amount
    }
    
    init(_ amount: Int) {
        self.amount = amount
    }
    
    func hasInvitation() -> Bool {
        invitation != nil
    }
    
    func hasTicket() -> Bool {
        ticket != nil
    }
    
    func setTicket(_ ticket: Ticket) {
        self.ticket = ticket
    }
    
    func minusAmount(_ amount: Int) {
        self.amount -= amount
    }
    
    func plusAmount(_ amount: Int) {
        self.amount += amount
    }
}

// 관람객
struct Audience {
    private var bag: Bag
    
    init(_ bag: Bag) {
        self.bag = bag
    }
    
    func getBag() -> Bag {
        bag
    }
}

// 매표소
class TicketOffice {
    private var amount: Int
    private var tickets = [Ticket]()
    
    init(_ amount: Int, _ tickets: [Ticket]) {
        self.amount = amount
        self.tickets = tickets
    }
    
    func getTicket() -> Ticket {
        tickets.removeFirst()
    }
    
    func minusAmount(_ amount: Int) {
        self.amount -= amount
    }
    
    func plusAmount(_ amount: Int) {
        self.amount += amount
    }
}

// 판매원
struct TicketSeller {
    private var ticketOffice: TicketOffice
    
    init(_ ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }
    
    func getTicketOffice() -> TicketOffice {
        ticketOffice
    }
}

// 극장
struct Theater {
    private var ticketSeller: TicketSeller
    
    init(_ ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }
    
    func enter(_ audience: Audience) {
        if audience.getBag().hasInvitation() {
            let ticket = ticketSeller.getTicketOffice().getTicket()
            audience.getBag().setTicket(ticket)
        } else {
            let ticket = ticketSeller.getTicketOffice().getTicket()
            audience.getBag().minusAmount(ticket.getFee())
            ticketSeller.getTicketOffice().plusAmount(ticket.getFee())
            audience.getBag().setTicket(ticket)
        }
    }
}
